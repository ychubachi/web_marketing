# -*- coding: utf-8 -*-

class RedirectorsController < ApplicationController
  include Utility
  
  #
  # GET /
  # ・デフォルトのURLにリダイレクトします．
  #
  def index
    logger.debug '### RedirectorsControllor#index'
    do_redirect # defaulct redirect
  end

  #
  # GET /rd/:code
  # ・:codeで指定されたURLを探し，リダイレクトします．
  #
  def redirect
    logger.debug '### RedirectorsControllor#redirect'
    code = params[:code]
    do_redirect code
  end

  #
  # リダイレクトに共通する処理を行います．
  #
  def do_redirect(code = nil)
    logger.debug "# リダイレクト先をDBから検索します".green
    redirection = nil
    if code then
      logger.debug '- コードで指定されたリダイレクト先を検索します'.green
      logger.debug "  code = #{code}".green
      redirection = Redirection.where('code = :code',{code: code}).first
    end
    if !redirection then
      logger.debug '- コードが指定されていない，または，' +
        '見つからなかったのでデフォルトを検索します．'.green
      redirection = Redirection.where('is_default = :flag', {flag: true}).first
    end
    if !redirection then
      logger.warn '# DBからリダイレクションURLが検索できませんでした．'.red
      logger.warn 'ハードコードされたURLを利用します．'.red
      redirection = create_default_redirection
    end
    logger.debug "# リダイレクト先: #{redirection.title}"
    redirect_url = redirection.target.url
    
    # cookiesにあるuuidからbrowserを取得し，
    # リクエストがあったことを記録します．
    uuid = read_or_create_uuid(cookies)
    browser = read_or_create_browser(uuid,
                                     request.user_agent.to_s)
    create_request(browser, redirection)

    # リダイレクトします．
    logger.info "# リダイレクトします: url = #{redirect_url}".green
    redirect_to redirect_url
  end

  #
  # GET /tracker
  # ・トラッカーのJava Scriptをレンダリングします．
  # 
  def tracker
    logger.debug '### RedirectorsControllor#tracker'.green
    uuid = read_or_create_uuid(cookies)
    read_or_create_browser(uuid, request.user_agent.to_s)
    render "tracker", formats: [:js]
  end

  #see: https://developer.mozilla.org/en/http_access_control#Access-Control-Allow-Headers
  #https://developer.mozilla.org/En/Server-Side_Access_Control
  def page_view
    logger.debug '### RedirectorsControllor#page'.green

    # for cookie credentials.
    headers['Access-Control-Allow-Origin'] = request.headers['Origin'].to_s
    headers['Access-Control-Allow-Credentials'] = 'true'

    if request.method == 'OPTIONS' then
      # 1回目はOPTIONメソッドで呼ばれます．Access-Controlを返します．
      logger.debug "### OPTION: Request headers.".blue
      logger.debug "### Orign=#{request.headers['Origin']}"
      logger.debug "### Access-Control-Request-Method=#{request.headers['Access-Control-Request-Method']}"
      logger.debug "### Access-Control-Request-Headers=#{request.headers['Access-Control-Request-Headers']}"
      
      # for access controls.
      headers['Access-Control-Allow-Method'] = 'POST'
      headers['Access-Control-Allow-Headers'] = 'origin, content-type, accept'
      render nothing: true
    elsif request.method == 'POST' then
      # 2回目はPOSTメソッドで呼ばれます．これが実際のメソッドです．
      logger.debug "### POST: Request headrs. Process actual request.".blue
      
      # record the page view.
      do_page_view
      render json: {result: 'ok'}
    else
      # other (GET)

      # record the page view.
      do_page_view
      render json: {result: 'ok'}
    end
  end

  def do_page_view
    # browserを取得します．
    uuid = read_or_create_uuid(cookies)
    browser = read_or_create_browser(uuid,
                                     request.user_agent.to_s)

    # urlとtitleに基づき，ページ・ビューがあったことを記録します．
    url = params[:url].to_s
    page_view = read_or_create_page_view(url,
                                         params[:title].to_s)

    # page_viewアクションを記録します．
    my_request = create_request(browser, page_view, url)
  end
end
