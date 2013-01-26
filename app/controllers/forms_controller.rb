# -*- coding: utf-8 -*-
class FormsController < ApplicationController
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
    logger.debug '# 資料請求フォームの内容を記録します'.green
    @form = Form.new(params[:form])

    if ! @form.save
      render action: "new"
      return
    end

    logger.debug '# 資料請求メールを送信します'.green
    begin
      @customer = @form
      @customer.inquiry = {"問い合わせ" => params[:comment]}.to_json
      record_conversion
    rescue => e
      logger.error ('# error on recording a conversion: ' + e.message).red
      e.backtrace.each {|l| logger.error l.red}
      redirect_to '/form/sorry'
      return
    end


    begin
      ConversionMailer.conversion(@customer, @conversion_path)
    rescue => e
      logger.error ('error on sending an email:' + e.message).red
      e.backtrace.each {|l| logger.error l.red}
      redirect_to '/form/sorry'
      return
    end
    logger.debug '# 資料請求メールを送信しました'.green

    redirect_to '/form/thank_you'
    return
    
  end
end
