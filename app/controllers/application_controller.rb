# -*- coding: utf-8 -*-

# 2013-01-23
# - このファイルを変更しても，自動的にリロードされません．
# 2013-01-23
# - Guardfileでこのファイルをwatchするようにしました．

class ApplicationController < ActionController::Base
  protect_from_forgery

  # サイン・アウト後，ログイン画面に遷移します
  # ※：これがないと，root_pathに遷移してしまいます
  def after_sign_out_path_for resource
    new_user_session_path
  end 

  # cookieにbrowserのuuidがあるか調べ，なければ新たに生成します．
  def get_browser
    logger.debug '# cookieからbrowserのuuidを取得します．'
    @browser_uuid = cookies[:web_marketing_uuid]
    if @browser_uuid.to_s == '' then
      logger.debug "# uuidが無かったので新規に生成します．"
      @browser_uuid = UUIDTools::UUID.random_create.to_s
      cookies[:web_marketing_uuid] = { value: @browser_uuid, expires: 365.days.from_now }
    end
    logger.info "# browserのuuidは#{@browser_uuid}です．"

    # lookup the browser from DB
    browser = Browser.where('uuid = :uuid', {uuid: @browser_uuid}).first_or_initialize
    if browser.new_record?
      logger.debug '# そのuuidを持つ新たなbrowserを作成してDBに保存します．'
      browser.uuid = @browser_uuid
      browser.user_agent = request.user_agent.to_s
      browser.save
    else
      logger.debug '# そのuuidを持つbrowserはすでにDBに存在しています．'
    end
    return browser
  end
end
