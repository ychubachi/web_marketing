# -*- coding: utf-8 -*-

# *4Q
# 12/15(土) 13:30-
# 12/21(金) 19:30-
#  1/11(金) 19:30-
#  1/19(土) 13:30-
#  2/ 2(土) 13:30-
#  2/ 8(金) 19:30-

class Landing::PageController < ApplicationController
  # GET /lp
  def index
  end
  
  # GET /lp/pm
  def pm
  end

  # GET /lp/thank_you
  def thank_you
  end

  # GET /lp/sorry
  def sorry
  end
  
  # POST /landing/page
  def create
    begin
      # get this browser.
      browser = get_browser
      
      # record a conversion with a new request.
      conversion = Conversion.where('title = :title', {title: "資料請求"}).first_or_initialize
      if conversion.new_record? then
        conversion.title = "資料請求"
        conversion.save!
      end
      save_request!(browser, conversion)

      # save a new customer information.
      customer = Customer.new(params[:customer])
      customer.browser = browser
      comment = params[:comment]
      guidance = params[:guidance]
      customer.inquiry = "{\"備考\":\"#{comment}\",\"説明会\":\"#{guidance}\"}"
      customer.save!
    rescue => e
      logger.error 'error on saving data'
      e.backtrace.each {|l| logger.error l}
      redirect_to '/lp/sorry'
      return
    end

    begin
      # send an email with a conversion path.
      conversion_path = browser.requests.order("created_at ASC")
      ConversionMailer.conversion(customer, conversion_path)

      # redirection
      redirect_to '/lp/thank_you'
    rescue => e
      logger.error 'error on sending an email.'
      e.backtrace.each {|l| logger.error l}
      redirect_to '/lp/sorry'
      return
    end
  end

  private

  def save_request!(browser, action)
    # save a new request.
    my_request = Request.new
    my_request.referrer = request.referer.to_s
    my_request.action   = action
    my_request.browser  = browser
    my_request.save!
  end
end
