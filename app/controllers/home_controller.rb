# -*- coding: utf-8 -*-
=begin
To create a new user

# rails c

User.create! do |u|
  u.email = 'user@example.com'
  u.password = 'please'
  u.password_confirmation = 'please'
end

=end

class HomeController < ApplicationController
  # GET /
  def index
    logger.debug '### HomeControllor#index'
    do_redirect # defaulct redirect
  end

  # GET /rd/:code
  def redirect
    logger.debug '### HomeControllor#redirect'
    code = params[:code]
    do_redirect code
  end

  def javascript
    logger.debug '### HomeControllor#javascript'
    logger.debug "### Cookie=#{request.headers['Cookie']}"
    get_browser() # create a new uuid
  end

  #see: https://developer.mozilla.org/en/http_access_control#Access-Control-Allow-Headers
  #https://developer.mozilla.org/En/Server-Side_Access_Control
  def page #todo: rename to page_view
    logger.debug '### HomeControllor#page'

    # for cookie credentials.
    headers['Access-Control-Allow-Origin'] = request.headers['Origin'].to_s
    headers['Access-Control-Allow-Credentials'] = 'true'

    if request.method == 'OPTIONS' then
      # OPTION
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
      # POST
      logger.debug "### POST: Request headrs"
      logger.debug "### Cookie=#{request.headers['Cookie']}"
      logger.debug "### Process actual request."
      # record the page view.
      do_page
      render json: {result: 'ok'}
    else
      # other (GET)
      do_page
      render json: {result: 'ok'}
    end
  end

  private

  def do_redirect(code = nil)
    logger.debug "### HomeController#do_redirect(id=#{code})"

    browser = get_browser()

    # lookup redirection
    if code == nil then
      logger.debug "コードが指定されていないのでデフォルトを検索します．"
      redirection = Redirection.where('is_default = :flag', {flag: true}).first
    else
      logger.debug "### redirect code = #{code}"
      redirection = Redirection.where('code = :code',{code: code}).first
    end

    # set url from redirect or use default.
    if redirection then
      logger.info "### redirection to #{redirection.title}"
      redirect_url = redirection.target.url
    else
      logger.warn 'DBからデフォルトのリダイレクションURLが検索できませんでした．ハードコードされたURLを利用します．'
      if Rails.env.production? then
        redirect_url = 'https://pr.aiit.ac.jp/'
      else
        redirect_url = 'http://localhost:3000/lp'
      end
    end
    logger.debug "### redirection url is #{redirect_url}"

    # save a new request.
    my_request = Request.new
    my_request.referrer = request.referer.to_s
    my_request.action = redirection
    my_request.browser = browser
    my_request.save

    # redicet
    redirect_to redirect_url
  end

  def do_page
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
    my_request.browser = get_browser
    my_request.save
  end
end
