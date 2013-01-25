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

  # アクセスしてきたブラウザをDBから検索します．
  def search_browser
    logger.debug '# cookieからbrowserのuuidを取得します．'.green
    @browser_uuid = cookies[:web_marketing_uuid]
    if @browser_uuid.to_s == '' then
      logger.debug "  - uuidが無かったので新規に生成します．".green
      @browser_uuid = UUIDTools::UUID.random_create.to_s
      cookies[:web_marketing_uuid] = { value: @browser_uuid, expires: 365.days.from_now }
    end
    logger.debug "  - browserのuuidは#{@browser_uuid}です．".green

    logger.debug '# uuidで指定されたbrowserを検索します．'.green
    @browser = Browser.where('uuid = :uuid', {uuid: @browser_uuid}).first_or_initialize
    if @browser.new_record?
      logger.debug '  - そのuuidを持つ新たなbrowserを作成してDBに保存します．'.green
      @browser.uuid = @browser_uuid
      @browser.user_agent = request.user_agent.to_s
      @browser.save
    else
      logger.debug '  - そのuuidを持つbrowserはすでにDBに存在しています．'.green
    end
    logger.debug "  - browserは#{@browser}です．".green

    return @browser
  end

  # コンバーションを記録し，顧客情報を登録します．
  def record_conversion
    search_browser
      
    logger.debug '# コンバーションを記録し，顧客情報を登録します．'.green
    logger.debug '  - 「資料請求」コンバーションを準備します．'.green
      conversion = Conversion
      .where('title = :title', {title: "資料請求"}).first_or_initialize
    if conversion.new_record? then
      conversion.title = "資料請求"
      conversion.save!
    end

    logger.debug '  - コンバージョンのリクエストがあったことを記録します'.green
    my_request = Request.new
    # ↓Binary data inserted for `string` type on column `referrer`となる
    # my_request.referrer = request.referer.to_s
    my_request.action   = conversion
    my_request.browser  = @browser
    my_request.save!
    
    logger.debug '  - 顧客情報を登録します．'.green
    @customer.browser = @browser
    @customer.save!
    
    logger.debug '  - コンバーション経路を参照します．'.green
    @conversion_path = @browser.requests.order("created_at ASC")
  end
end
