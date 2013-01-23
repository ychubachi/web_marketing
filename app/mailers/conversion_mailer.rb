# -*- coding: utf-8 -*-
class ConversionMailer < ActionMailer::Base
  default 'Content-Transfer-Encoding' => '7bit'
  default from: "AIIT Landing Page <noreply@pr.aiit.ac.jp>"

  def conversion(customer, conversion_path)
    logger.debug '# 担当者にメールを送信します．'.green
    @customer = customer
    @inquiry = ActiveSupport::JSON.decode(customer.inquiry)
    @conversion_path = conversion_path
    mail(
         to: ["yc@aiit.ac.jp", "info@aiit.ac.jp"],
         subject: "AIIT Landing Pageからのお問い合わせ").deliver
  end
end
