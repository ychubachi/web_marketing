# -*- coding: utf-8 -*-
module Utility
  def read_or_create_uuid(cookies)
    uuid = cookies[:web_marketing_uuid]
    if uuid.nil? then
      logger.debug "  - cookieにuuidが無かったので新規に生成します．".green
      uuid = UUIDTools::UUID.random_create.to_s
      cookies[:web_marketing_uuid] = {
        value: uuid,
        expires: 365.days.from_now }
    end
    return uuid
  end

  def read_or_create_browser_by_uuid(browser_uuid)
    browser = Browser.where('uuid = :uuid',
                            {uuid: browser_uuid}).first_or_initialize
    if browser.new_record?
      logger.debug '  - 新たなbrowserを作成してDBに保存します．'.green
      browser.uuid = browser_uuid
      browser.user_agent = request.user_agent.to_s
      browser.save
    else
      logger.debug '  - そのuuidを持つbrowserはすでにDBに存在しています．'.green
    end
    
    return browser
  end
end
