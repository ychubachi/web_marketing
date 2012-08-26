# -*- coding: utf-8 -*-
class Landing::PageController < ApplicationController
  def initialize
    # @guidance_table = [['7/28(土)','15:00～16:30'],['8/ 8(水)','19:30～21:00'],['8/17(金)','19:30～21:00']]
    @guidance_table = [['未定','10月以降開催予定']]
    super
  end

  def display
    file_base_name = params[:file]
    
    begin
      # get this browser.
      browser = get_browser
      
      # record a conversion with a new request.
      impression = Impression.where('display = :display', {display: file_base_name}).first_or_initialize
      if impression.new_record? then
        impression.display = file_base_name
        impression.save!
      end
      save_request!(browser, impression)
    rescue => e
      logger.error 'error on saving an impression'
      puts e
      redirect_to '/lp/sorry' and return
    end

    begin
      image_file_path = "app/views/landing/page/impressions/#{file_base_name}.gif"
      send_file(image_file_path, :disposition => 'inline')
    rescue => e
      logger.error 'error on reading image file'
      puts e
      redirect_to '/lp/sorry'
    end
  end

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
      customer.save!

      # send an email with a conversion path.
      conversion_path = browser.requests.order("created_at ASC")
      ConversionMailer.conversion(customer, conversion_path).deliver

      # redirection
      redirect_to '/lp/thank_you'
    rescue => e
      logger.error 'error on saving data'
      puts e
      redirect_to '/lp/sorry'
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
