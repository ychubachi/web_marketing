# -*- coding: utf-8 -*-
require 'spec_helper'
require 'email_spec'

describe ConversionMailer do
  describe '「資料請求メールを送信する」とは' do
    it 'Customerを生成し，メールを送信します' do
      customer = FactoryGirl.create(:customer)
      request = FactoryGirl.create(:request)
      conversion_path = [request]
      reset_mailer
      ConversionMailer.conversion(customer, conversion_path)
      unread_emails_for("info@aiit.ac.jp").size.should == parse_email_count(1)
    end
  end
end
