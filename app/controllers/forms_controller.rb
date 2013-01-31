# -*- coding: utf-8 -*-
class FormsController < ApplicationController
  include Utility

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
      inquiry = {"問い合わせ" => params[:comment]}.to_json
      params[:customer][:inquiry] = inquiry

      user_agent = request.user_agent.to_s
      record_conversion_and_send_email(params, cookies, user_agent)
      
      redirect_to '/form/thank_you' and return
    rescue => e
      logger.error ('コンバーションの登録・メール配信時に例外が発生しました: ' + e.message).red
      # e.backtrace.each {|l| logger.error l.red}
      redirect_to '/form/sorry' and return
    end
    
  end
end
