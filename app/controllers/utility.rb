# -*- coding: utf-8 -*-

module Utility
  # コンバーションを記録し，顧客情報を登録します．
  def record_conversion
    warn '[WARN] record_conversion is duplicated.'.red
    warn ('[WARN] called from:' +  caller[0]).red
    browser_uuid = read_or_create_uuid(cookies)
    browser = read_or_create_browser(browser_uuid,
                                     request.user_agent.to_s)
  
  end

  def read_or_create_uuid(cookies)
    logger.debug '# cookieからbrowserのuuidを取得します．'.green
    uuid = cookies[:web_marketing_uuid]
    if uuid.nil? then
      logger.debug "  - cookieにuuidが無かったので新規に生成します．".green
      uuid = UUIDTools::UUID.random_create.to_s
      cookies[:web_marketing_uuid] = {
        value: uuid,
        expires: 365.days.from_now }
    end
    logger.debug "  - browserのuuidは#{uuid}です．".green
    return uuid
  end

  def read_or_create_browser(browser_uuid, user_agent)
    logger.debug '# uuidで指定されたbrowserを検索します．'.green
    browser = Browser.where('uuid = :uuid',
                            {uuid: browser_uuid}).first_or_initialize
    if browser.new_record?
      logger.debug '  - 新たなbrowserを作成してDBに保存します．'.green
      browser.uuid = browser_uuid
      browser.user_agent = user_agent
      browser.save
    else
      logger.debug '  - そのuuidを持つbrowserはすでにDBに存在しています．'.green
    end
    logger.debug "  - browserは#{browser}です．".green
    return browser
  end

  def read_or_create_conversion(title)
    logger.debug '# コンバーションを記録し，顧客情報を登録します．'.green
    logger.debug "  - 「#{title}」コンバーションを準備します．".green
      conversion = Conversion
      .where('title = :title', {title: title}).first_or_initialize
    if conversion.new_record? then
      conversion.title = title
      conversion.save!
    end
    return conversion
  end

  def create_request(browser, action, referrer = '')
    logger.debug '  - コンバージョンのリクエストがあったことを記録します'.green
    my_request = Request.new
    my_request.browser  = browser
    my_request.action   = action
    my_request.referrer = referrer
    my_request.save!
    return my_request
  end

  def create_default_redirection
    medium = Medium.new
    medium.title = 'default'
    medium.save!
    target = Target.new
    target.title = 'default'
    if Rails.env.production? then
      target.url = 'https://pr.aiit.ac.jp/lp'
    else
      target.url = 'http://localhost:3000/lp'
    end
    target.save!
    redirection = Redirection.new
    redirection.medium = medium
    redirection.target = target
    redirection.save!
    return redirection
  end

  def read_or_create_page_view(url, title)
    logger.debug '### url = ' + url
    page_view = PageView.where('url = :url', {url: url}).first_or_initialize
    if page_view.new_record? then
      logger.debug '### create a new page and save it'
      page_view.url = url
    end

    # set a title to the page view.
    logger.info "### page view:  #{title}"

    page_view.title = title # keep page titles update.
    page_view.save!
    
    return page_view
  end

  def get_browser_from(cookies, user_agent)
    uuid = read_or_create_uuid(cookies)
    browser = read_or_create_browser(uuid,
                                     user_agent)
    return browser
  end
  
end
