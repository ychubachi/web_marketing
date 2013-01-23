# -*- coding: utf-8 -*-

class HomeController < ApplicationController
  #
  # GET /
  # ・デフォルトのURLにリダイレクトします．
  #
  def index
    logger.debug '### HomeControllor#index'
    do_redirect # defaulct redirect
  end

  #
  # GET /rd/:code
  # ・:codeで指定されたURLを探し，リダイレクトします．
  #
  def redirect
    logger.debug '### HomeControllor#redirect'
    code = params[:code]
    do_redirect code
  end

  #
  # GET /tracker
  # ・トラッカーのJava Scriptをレンダリングします．
  # 
  def tracker
    logger.debug '### HomeControllor#javascript'
    search_browser() # create a new uuid for this browser.
    render "tracker", formats: [:js]
  end

  #see: https://developer.mozilla.org/en/http_access_control#Access-Control-Allow-Headers
  #https://developer.mozilla.org/En/Server-Side_Access_Control
  def page_view
    logger.debug '### HomeControllor#page'

    # for cookie credentials.
    headers['Access-Control-Allow-Origin'] = request.headers['Origin'].to_s
    headers['Access-Control-Allow-Credentials'] = 'true'

    if request.method == 'OPTIONS' then
      # 1回目はOPTIONメソッドで呼ばれます．Access-Controlを返します．
      logger.debug "### OPTION: Request headers"
      logger.debug "### Orign=#{request.headers['Origin']}"
      logger.debug "### Access-Control-Request-Method=#{request.headers['Access-Control-Request-Method']}"
      logger.debug "### Access-Control-Request-Headers=#{request.headers['Access-Control-Request-Headers']}"
      logger.debug "### Return Access-Controll headers"
      # for access controls.
      headers['Access-Control-Allow-Method'] = 'POST'
      headers['Access-Control-Allow-Headers'] = 'origin, content-type, accept'
      render nothing: true
    elsif request.method == 'POST' then
      # 2回目はPOSTメソッドで呼ばれます．これが実際のメソッドです．
      logger.debug "### POST: Request headrs"
      logger.debug "### Cookie=#{request.headers['Cookie']}"
      logger.debug "### Process actual request."
      # record the page view.
      do_page_view
      render json: {result: 'ok'}
    else
      # other (GET)
      do_page_view
      render json: {result: 'ok'}
    end
  end

  private

  def do_redirect(code = nil)
    logger.debug "# リダイレクト先をDBから検索します".green
    if code then
      logger.debug "- 指定されたコードに対応するリダイレクト先を検索します: code = #{code}".green
      redirection = Redirection.where('code = :code',{code: code}).first
    else
      logger.debug "- コードが指定されていないのでデフォルトを検索します．".green
      redirection = Redirection.where('is_default = :flag', {flag: true}).first
    end

    if redirection then
      logger.info "# リダイレクト先: #{redirection.title}"
      redirect_url = redirection.target.url
      
      # 変数名が@my_requestになっているのは，
      # HTTP Requestを示すもともとの変数名と重複するからです．
      @my_request = Request.new
      @my_request.referrer = request.referer.to_s
      @my_request.action = redirection
      @my_request.browser = search_browser()
      @my_request.save
    else
      logger.warn '# DBからデフォルトのリダイレクションURLが検索できませんでした．ハードコードされたURLを利用します．'.red
      if Rails.env.production? then
        redirect_url = 'https://pr.aiit.ac.jp/lp'
      else
        redirect_url = 'http://localhost:3000/lp'
      end
    end

    logger.debug "# リダイレクトします: url = #{redirect_url}".green
    redirect_to redirect_url
  end

  def do_page_view
    # find the page specified by url.
    url = params[:url].to_s
    logger.debug '### url = ' + url
    page_view = PageView.where('url = :url', {url: url}).first_or_initialize
    if page_view.new_record? then
      logger.debug '### create a new page and save it'
      page_view.url = url
    end

    # set a title to the page view.
    title = params[:title].to_s
    logger.info "### page view:  #{title}"

    page_view.title = title # keep page titles update.
    page_view.save

    # save a new request.
    my_request = Request.new
    my_request.referrer = url
    my_request.action = page_view
    my_request.browser = search_browser
    my_request.save
  end
end
