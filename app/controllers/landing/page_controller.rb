# -*- coding: utf-8 -*-
class Landing::PageController < ApplicationController
  def index
    @customer = Customer.new
  end

  def thank_you
  end

  def sorry
  end

  def create
    # save a new customer information.
    browser = get_browser
    customer = Customer.new(params[:customer])
    customer.browser = browser
    if ! customer.save
      redirect_to '/lp/sorry'
      logger.info 'error'
      return
    end

    # record a conversion.
    conversion = Conversion.where('title = :title', {title: "資料請求"}).first_or_initialize
    if conversion.new_record? then
      conversion.title = "資料請求"
    end
    if ! conversion.save
      redirect_to '/lp/sorry'
      logger.info 'error'
      return
    end

    # save a new request.
    my_request = Request.new
    my_request.referrer = request.referer.to_s
    my_request.action = conversion
    my_request.browser = browser
    if ! my_request.save
      redirect_to '/lp/sorry'
      logger.info 'error'
      return
    end

    # obtain the convrsion path of the browser.
    conversion_path = Request.where("browser_id = :browser_id", {browser_id: browser}).order("created_at ASC")
    logger.info (conversion_path.to_yaml)

    # send an email.
    ConversionMailer.conversion(customer, conversion_path).deliver

    redirect_to '/lp/thank_you'
    logger.info 'successfully created.'
  end
end
