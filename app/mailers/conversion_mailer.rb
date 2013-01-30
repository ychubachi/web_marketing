# -*- coding: utf-8 -*-
class ConversionMailer < ActionMailer::Base
  default 'Content-Transfer-Encoding' => '7bit'
  default from: "AIIT Landing Page <noreply@pr.aiit.ac.jp>"

  def conversion(form)
    logger.debug '# 担当者にメールを送信します．'.green
    @form = form
    begin
      @inquiry = JSON.parse(form.inquiry)
    rescue JSON::ParserError => e
      logger.warn 'JSONのparse時に例外が発生しました．'.green
      @inquiry = {'内容' => form.inquiry}
    end
    logger.debug '  - コンバーション経路を参照します．'.green
    @conversion_path = form.browser.requests.order("created_at ASC")

    mail(
         to: ["yc@aiit.ac.jp", "info@aiit.ac.jp"],
         subject: "AIIT Landing Pageからのお問い合わせ").deliver
  end
end
