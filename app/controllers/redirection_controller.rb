class RedirectionController < ApplicationController
  def initialize
    @default_redirect = 'http://aiit.ac.jp/'
  end

  def index
    logger.info '### RedirectionControllor#index'
    do_redirect # defaulct redirect
  end

  def redirect
    logger.info '### RedirectionControllor#redirect'
    code = params[:code]
    do_redirect code
  end

  private

  def do_redirect(code = nil)
    logger.info "### RedirectionController#do_redirect(id=#{code})"

    # get browser uuid id from the cookies.
    uuid = cookies[:uuid]
    if uuid.to_s == '' then
      uuid = UUIDTools::UUID.random_create.to_s
      cookies[:uuid] = { value: uuid, expires: 365.days.from_now }
      logger.info '### new browser. uuid=#{uuid}'
    else
      logger.info '### repeated browser. uuid=#{uuid}'
    end

    # lookup the browser from DB
    browser = Browser.where('uuid = :uuid', {uuid: uuid}).first_or_initialize
    if browser.new_record?
      logger.info '### create a new browser and save it.'
      browser.uuid = uuid
      browser.user_agent = request.user_agent
      browser.save
    else
      logger.info '### the browser already exists in DB.'
    end
      
    # lookup redirection
    redirection = nil
    if code == nil then
      logger.info "### default redirection"
      redirection = Redirection.where('is_default = :flag', {flag: true}).first
    else
      logger.info "### redirect code = #{code}"
      redirection = Redirection.where('code = :code',{code: code}).first
    end

    # set url from redirect or use default.
    redirect_url = nil
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
    my_request.browser = browser
    my_request.action = action
    my_request.save

    # redicet
    redirect_to redirect_url
  end
end
