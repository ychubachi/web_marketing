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
  def page
    logger.info '### HomeControllor#page'

    if request.method == 'OPTIONS' then
      # OPTION
      logger.info "### OPTION: Request headers"
      logger.info "### Orign=#{request.headers['Origin']}"
      logger.info "### Access-Control-Request-Method=#{request.headers['Access-Control-Request-Method']}"
      logger.info "### Access-Control-Request-Headers=#{request.headers['Access-Control-Request-Headers']}"
      logger.info "### Cookie=#{request.headers['Cookie']}"
      logger.info "### Return Access-Controll headers"
      headers['Access-Control-Allow-Origin'] = request.headers['Origin']
      headers['Access-Control-Allow-Method'] = 'POST'
      headers['Access-Control-Allow-Headers'] = 'origin, content-type, accept, cookie'
      render nothing: true
    else
      # POST
      logger.info "### POST: Request headrs"
      logger.info "### Cookie=#{request.headers['Cookie']}"
      logger.info "### Process actual request."
      headers['Access-Control-Allow-Origin'] = '*' 
      do_page
      respond_to do |format|
        format.json { render json: {result: 'ok'} }
      end
    end
  end

  def admin
    respond_to do |format|
      format.html { render layout: 'application' }
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

    # save a new action
    action = Action.new
    action.redirection = redirection
    action.save

    # save a new request.
    my_request = Request.new
    my_request.referrer = request.referer
    my_request.action = action
    my_request.browser = browser
    my_request.save

    # redicet
    redirect_to redirect_url
  end

  def do_page
    # find the page specified by url.
    referrer = request.referer
    logger.info '### referrer = ' + referrer.to_s
    page = Page.where('url = :url', {url: referrer}).first_or_initialize
    if page.new_record? then
      logger.info '### create a new page and save it'
      page.url = referrer
    end

    # set a title to the page
    title = params[:title]
    logger.info '### title = ' + title.to_s
    page.title = title # keep page titles update.
    page.save

    # get a new action
    action = Action.new
    action.page = page
    action.save

    # get the browser
    browser = get_browser

    # save a new request.
    my_request = Request.new
    my_request.referrer = request.referer
    my_request.action = action
    my_request.browser = browser
    my_request.save
  end

  def get_browser
    # get browser's uuid from the cookies.
    uuid = cookies[:web_marketing_uuid]
    if uuid.to_s == '' then
      uuid = UUIDTools::UUID.random_create.to_s
      cookies[:web_marketing_uuid] = { value: uuid, expires: 365.days.from_now }
      logger.info "### new browser. uuid=#{uuid}"
    else
      logger.info "### repeated browser. uuid=#{uuid}"
    end

    # lookup the browser from DB
    browser = Browser.where('uuid = :uuid', {uuid: uuid}).first_or_initialize
    if browser.new_record?
      logger.info '### create a new browser and save it.'
      browser.uuid = uuid
      browser.user_agent = request.user_agent.to_s
      browser.save
    else
      logger.info '### the browser already exists in DB.'
    end
    return browser
  end
end
