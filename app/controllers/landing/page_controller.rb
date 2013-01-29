# -*- coding: utf-8 -*-

# *4Q
# 12/15(土) 13:30-
# 12/21(金) 19:30-
#  1/11(金) 19:30-
#  1/19(土) 13:30-
#  2/ 2(土) 13:30-
#  2/ 8(金) 19:30-

class Landing::PageController < ApplicationController
  include Utility
  
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
    logger.debug '# 資料請求メールを送信します'.green
    begin
      @customer = Customer.new(params[:customer])
      comment = params[:comment]
      guidance = params[:guidance]
      @customer.inquiry = {"備考" => comment, "説明会" => guidance}.to_json
      record_conversion
    rescue => e
      logger.error ('# error on recording a conversion: ' + e.message).red
      e.backtrace.each {|l| logger.error l.red}
      redirect_to '/lp/sorry'
      return
    end

    begin
      ConversionMailer.conversion(@customer, @conversion_path)
    rescue => e
      logger.error ('error on sending an email:' + e.message).red
      e.backtrace.each {|l| logger.error l.red}
      redirect_to '/lp/sorry'
      return
    end
    logger.debug '# 資料請求メールを送信しました'.green

    redirect_to '/lp/thank_you'
    return
  end
end
