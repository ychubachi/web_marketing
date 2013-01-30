# -*- coding: utf-8 -*-
require 'spec_helper'
require 'email_spec'

describe ConversionMailer do
  describe '「資料請求メールを送信する」とは' do
    it 'Customerを生成し，メールを送信します' do
      browser = FactoryGirl.create(:browser)
      
      action1 = FactoryGirl.create(:page_view)
      request1 = FactoryGirl.create(:request)
      request1.browser = browser
      request1.action = action1
      request1.save!
      
      action2 = FactoryGirl.create(:conversion)
      request2 = FactoryGirl.create(:request)
      request2.browser = browser
      request2.action = action2
      request2.save!
      
      customer = FactoryGirl.create(:customer)
      customer.browser = browser
      customer.save!
      
      # メールを送信します
      reset_mailer
      ConversionMailer.conversion(customer)
      unread_emails_for("info@aiit.ac.jp").size.should == parse_email_count(1)
    end
  end
end
