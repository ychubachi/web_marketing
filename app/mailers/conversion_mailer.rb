# -*- coding: utf-8 -*-
class ConversionMailer < ActionMailer::Base
  default from: "AIIT Landing Page <noreply@pr.aiit.ac.jp>"

  def conversion(customer, conversion_path)
    @customer = customer
    # customer.inquiryはJSで生成するのでテスト時は空です
    if customer.inquiry == "" then
      customer.inquiry = "[]"
    end
    @inquiry = ActiveSupport::JSON.decode(customer.inquiry)
    @conversion_path = conversion_path
    mail(
         to: ["yc@aiit.ac.jp", "info@aiit.ac.jp"],
         subject: "AIIT Landing Pageからのお問い合わせ").deliver
  end
end
