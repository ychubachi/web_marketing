# -*- coding: utf-8 -*-

# *4Q
# 12/15(土) 13:30-
# 12/21(金) 19:30-
#  1/11(金) 19:30-
#  1/19(土) 13:30-
#  2/ 2(土) 13:30-
#  2/ 8(金) 19:30-

class PagesController < ApplicationController
  include Utility

  # GET /page/new
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.haml
    end
  end

  # GET /page/pm
  def pm
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.haml
    end
  end

  # POST /page
  def create
    
    begin
      logger.debug '# 資料請求フォームの内容を記録します'.green
      comment = params[:comment]
      guidance = params[:guidance]
      inquiry = {"備考" => comment, "説明会" => guidance}.to_json

      logger.debug '  - 顧客情報を登録します．'.green
      @customer = Customer.new(params[:customer])
      @customer.browser = get_browser_from(cookies, request.user_agent.to_s)
      @customer.inquiry = inquiry
      @customer.save!
      
      record_conversion_and_send_email(@customer)
      redirect_to '/page/thank_you' and return
    rescue => e
      logger.error ('コンバーションの登録・メール配信時に例外が発生しました: ' + e.message).red
      # e.backtrace.each {|l| logger.error l.red}
      redirect_to '/page/sorry' and return
    end
  end
end
