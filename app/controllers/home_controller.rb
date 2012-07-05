class HomeController < ApplicationController
  def initialize
    @default_redirect = 'http://aiit.ac.jp/'
  end

  def index
    logger.info '### HomeControllor#index'
    do_redirect # defaulct redirect
  end

  def redirect
    logger.info '### HomeControllor#redirect'
    code = params[:code]
    do_redirect code
  end

  def javascript
    logger.info '### HomeControllor#javascript'
    logger.info "### Cookie=#{request.headers['Cookie']}"
    get_browser() # create a new uuid
  end

  #see: https://developer.mozilla.org/en/http_access_control#Access-Control-Allow-Headers
  #https://developer.mozilla.org/En/Server-Side_Access_Control
  def page #todo: rename to page_view
    logger.info '### HomeControllor#page'

    # for cookie credentials.
    headers['Access-Control-Allow-Origin'] = request.headers['Origin'].to_s
    headers['Access-Control-Allow-Credentials'] = 'true'

    if request.method == 'OPTIONS' then
      # OPTION
      logger.info "### OPTION: Request headers"
      logger.info "### Orign=#{request.headers['Origin']}"
      logger.info "### Access-Control-Request-Method=#{request.headers['Access-Control-Request-Method']}"
      logger.info "### Access-Control-Request-Headers=#{request.headers['Access-Control-Request-Headers']}"
      logger.info "### Return Access-Controll headers"
      # for access controls.
      headers['Access-Control-Allow-Method'] = 'POST'
      headers['Access-Control-Allow-Headers'] = 'origin, content-type, accept'
      render nothing: true
    elsif request.method == 'POST' then
      # POST
      logger.info "### POST: Request headrs"
      logger.info "### Cookie=#{request.headers['Cookie']}"
      logger.info "### Process actual request."
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
    logger.info "### HomeController#do_redirect(id=#{code})"

    browser = get_browser()

    # lookup redirection
    if code == nil then
      logger.info "### default redirection"
      redirection = Redirection.where('is_default = :flag', {flag: true}).first
    else
      logger.info "### redirect code = #{code}"
      redirection = Redirection.where('code = :code',{code: code}).first
    end

    # set url from redirect or use default.
    if redirection then
      logger.info "### redirection to #{redirection.title}"
      redirect_url = redirection.target.url
    else
      logger.info '### unknown redirection is specified. use default.'
      redirect_url = @default_redirect
    end
    logger.info "### redirection url is #{redirect_url}"

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
    referrer = request.referer.to_s
    logger.info '### referrer = ' + referrer
    page_view = PageView.where('url = :url', {url: referrer}).first_or_initialize
    if page_view.new_record? then
      logger.info '### create a new page and save it'
      page_view.url = referrer
    end

    # set a title to the page view.
    title = params[:title]
    logger.info '### title = ' + title.to_s
    page_view.title = title # keep page titles update.
    page_view.save

    # save a new request.
    my_request = Request.new
    my_request.referrer = referrer
    my_request.action = page_view
    my_request.browser = get_browser
    my_request.save
  end
end
