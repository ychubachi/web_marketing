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
      inquiry = {"問い合わせ" => params[:comment]}.to_json

      logger.debug '  - 顧客情報を登録します．'.green
      @customer = Customer.new(params[:customer])
      @customer.browser = get_browser_from(cookies, request.user_agent.to_s)
      @customer.inquiry = inquiry
      @customer.save!

      record_conversion_and_send_email(@customer)
      redirect_to '/form/thank_you' and return
    rescue => e
      logger.error ('コンバーションの登録・メール配信時に例外が発生しました: ' + e.message).red
      # e.backtrace.each {|l| logger.error l.red}
      redirect_to '/form/sorry' and return
    end
    
  end
end
