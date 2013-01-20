# -*- coding: utf-8 -*-
require 'spec_helper'

describe ConversionMailer do
  describe 'send' do
    it '資料請求メールを送信します' do
      customer = FactoryGirl.create(:customer)
      request = FactoryGirl.create(:request)
      conversion_path = [request]
      reset_mailer
      ConversionMailer.conversion(customer, conversion_path)
      unread_emails_for("info@aiit.ac.jp").size.should == parse_email_count(1)
    end
  end
end
