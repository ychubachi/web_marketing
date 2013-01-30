# -*- coding: utf-8 -*-
class FormsController < ApplicationController
  include Utility
  
  layout 'bootstrap/application'

  # GET /forms/new
  # GET /forms/new.json
  def new
    @form = Form.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @form }
    end
  end

  # GET /forms/1/edit
  def edit
    @form = Form.find(params[:id])
  end

  # POST /forms
  # POST /forms.json
  def create

    begin
      logger.debug '# 資料請求フォームの内容を記録します'.green

      # browserを取得します．
      browser = get_browser_from(cookies, request.user_agent.to_s)

      logger.debug '  - 問い合わせ内容を登録します．'.green
      @form = Form.new(params[:form])
      @form.browser = browser
      @form.save!
      
      logger.debug '  - 顧客情報を登録します．'.green
      @customer = create_customer_from_form(@form)
      @customer.inquiry = {"問い合わせ" => params[:comment]}.to_json
      @customer.save!
      
      conversion = read_or_create_conversion("資料請求")
      create_request(browser, conversion)

    rescue => e
      logger.error ('# error on recording a conversion: ' + e.message).red
      e.backtrace.each {|l| logger.error l.red}
      redirect_to '/form/sorry'
      return
    end

    begin
      logger.debug '# 資料請求メールを送信します'.green
      ConversionMailer.conversion(@customer)
      logger.debug '# 資料請求メールを送信しました'.green
    rescue => e
      logger.error ('error on sending an email:' + e.message).red
      e.backtrace.each {|l| logger.error l.red}
      redirect_to '/form/sorry'
      return
    end

    redirect_to '/form/thank_you'
    return
    
  end
end
