# -*- coding: utf-8 -*-

class PagesController < ApplicationController
  include Utility

  def initialize
    @guidance_table = [
                       ['7/3(水)','19:30-21:00'],
                       ['7/13(土)', '13:30-15:00'],
                       ['7/20(土)', '13:30-15:00'],
                       ['7/31(水)','19:30-21:00'],
                       ['8/10(土)', '13:30-15:00'],
                       ['8/24(土)', '13:30-15:00'],
                      ]
    super
  end

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
      comment = params[:comment]
      guidance = params[:guidance]
      inquiry = {"備考" => comment, "説明会" => guidance}.to_json
      params[:customer][:inquiry] = inquiry

      user_agent = request.user_agent.to_s
      record_conversion_and_send_email(params, cookies, user_agent)
      
      redirect_to thank_you_page_path and return
    rescue => e
      logger.error ('コンバーションの登録・メール配信時に例外が発生しました: ' + e.message).red
      # e.backtrace.each {|l| logger.error l.red}
      redirect_to sorry_page_path and return
    end
  end
end
