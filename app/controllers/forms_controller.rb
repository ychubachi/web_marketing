# -*- coding: utf-8 -*-
class FormsController < ApplicationController
  include Utility
  
  layout 'bootstrap/application'

  # GET /forms/new
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.haml
    end
  end

  # POST /forms
  def create

    begin
      logger.debug '# 資料請求フォームの内容を記録します'.green

      logger.debug ' - browserを取得します．'.green
      browser = get_browser_from(cookies, request.user_agent.to_s)

      logger.debug '  - 顧客情報を登録します．'.green
      @customer = Customer.new(params[:customer])
      @customer.inquiry = {"問い合わせ" => params[:comment]}.to_json
      @customer.browser = browser
      @customer.save!

      logger.debug '  - 「資料請求」のコンバーションを登録します．'.green
      conversion = read_or_create_conversion("資料請求")
      create_request(browser, conversion)

      logger.debug '# 資料請求メールを送信します'.green
      ConversionMailer.conversion(@customer)
      logger.debug '# 資料請求メールを送信しました'.green

      redirect_to '/form/thank_you'
      return
    rescue => e
      logger.error ('# error on recording a conversion: ' + e.message).red
      e.backtrace.each {|l| logger.error l.red}
      redirect_to '/form/sorry'
      return
    end
    
  end
end
