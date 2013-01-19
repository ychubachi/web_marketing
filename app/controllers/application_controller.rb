# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  # サイン・アウト後，ログイン画面に遷移します
  # ※：これがないと，root_pathに遷移してしまいます
  def after_sign_out_path_for resource
    new_user_session_path
  end 

  def get_browser
    # get browser's uuid from the cookies.
    uuid = cookies[:web_marketing_uuid]
    if uuid.to_s == '' then
      uuid = UUIDTools::UUID.random_create.to_s
      cookies[:web_marketing_uuid] = { value: uuid, expires: 365.days.from_now }
      logger.info "### browser uuid=#{uuid} [NEW]"
    else
      logger.info "### browser uuid=#{uuid}"
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
