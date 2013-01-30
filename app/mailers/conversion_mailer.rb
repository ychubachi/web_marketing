# -*- coding: utf-8 -*-
class ConversionMailer < ActionMailer::Base
  default 'Content-Transfer-Encoding' => '7bit'
  default from: "AIIT Landing Page <noreply@pr.aiit.ac.jp>"

  def conversion(customer)
    logger.debug '# 担当者にメールを送信します．'.green
    @customer = customer
    begin
      @inquiry = JSON.parse(customer.inquiry)
    rescue JSON::ParserError => e
      logger.warn 'JSONのparse時に例外が発生しました．'.green
      @inquiry = {'内容' => customer.inquiry}
    end
    logger.debug '  - コンバーション経路を参照します．'.green
    @conversion_path = customer.browser.requests.order("created_at ASC")

    mail(
         to: ["yc@aiit.ac.jp", "info@aiit.ac.jp"],
         subject: "AIIT Landing Pageからのお問い合わせ").deliver
  end
end
