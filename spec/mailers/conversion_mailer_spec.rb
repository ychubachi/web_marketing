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
      
      unread_emails_for("info@aiit.ac.jp").size.should == 1
      mail = open_email("info@aiit.ac.jp")
      mail.should have_content customer.family_name
      mail.should have_content customer.given_name
      mail.should have_content customer.email
      mail.should have_content customer.postal_code
      mail.should have_content customer.address
      JSON.parse(customer.inquiry).each_pair {|k,v|
        mail.should have_content k
        mail.should have_content v
      }
      
      mail.should have_content action1.title
      mail.should have_content action2.title
    end
  end
end
