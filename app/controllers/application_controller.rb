class ApplicationController < ActionController::Base
  protect_from_forgery

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
      logger.debug '### create a new browser and save it.'
      browser.uuid = uuid
      browser.user_agent = request.user_agent.to_s
      browser.save
    else
      logger.debug '### the browser already exists in DB.'
    end
    return browser
  end
end
