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
    logger.debug '# 資料請求メールを送信します．'.green
    
    begin
      logger.debug ' - browserを取得します．'.green
      browser = get_browser_from(cookies, request.user_agent.to_s)

      logger.debug '  - 顧客情報を登録します．'.green
      @customer = Customer.new(params[:customer])
      comment = params[:comment]
      guidance = params[:guidance]
      @customer.inquiry = {"備考" => comment, "説明会" => guidance}.to_json
      @customer.browser = browser
      @customer.save!

      logger.debug '  - 「資料請求」のコンバーションを登録します．'.green
      conversion = read_or_create_conversion("資料請求")
      create_request(browser, conversion)

      ConversionMailer.conversion(@customer)
    rescue => e
      logger.error ('コンバーションの登録・メール配信時に例外が発生しました: ' + e.message).red
      # e.backtrace.each {|l| logger.error l.red}
      redirect_to '/lp/sorry' and return
    end

    logger.debug '# 資料請求メールを送信しました'.green
    redirect_to '/lp/thank_you'
  end
end
