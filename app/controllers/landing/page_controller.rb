# -*- coding: utf-8 -*-
class Landing::PageController < ApplicationController
  def index
    @guidance_table = [['7/28(土)','15:00～16:30'],['8/ 8(水)','19:30～21:00'],['8/17(金)','19:30～21:00']]
  end

  def pm
    @guidance_table = [['7/28(土)','15:00～16:30'],['8/ 8(水)','19:30～21:00'],['8/17(金)','19:30～21:00']]
  end

  def create
    begin
      # save a new customer information.
      browser = get_browser
      customer = Customer.new(params[:customer])
      customer.browser = browser
      customer.save!

      # record a conversion.
      conversion = Conversion.where('title = :title', {title: "資料請求"}).first_or_initialize
      if conversion.new_record? then
        conversion.title = "資料請求"
        conversion.save!
      end

      # save a new request.
      my_request = Request.new
      my_request.referrer = request.referer.to_s
      my_request.action = conversion
      my_request.browser = browser
      my_request.save!

      # obtain the convrsion path of the browser.
      # conversion_path = Request.where("browser_id = :browser_id", {browser_id: browser}).order("created_at ASC")
      conversion_path = browser.requests.order("created_at ASC")
      logger.debug (conversion_path.to_yaml)

      # send an email.
      ConversionMailer.conversion(customer, conversion_path).deliver

      redirect_to '/lp/thank_you'
      logger.info 'successfully created.'
    rescue
      redirect_to '/lp/sorry'
      logger.info 'error on saving data'
    end
  end
end
