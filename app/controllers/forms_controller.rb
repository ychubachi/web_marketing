# -*- coding: utf-8 -*-

# == 概要
# このコントローラーは，資料請求フォームを取り扱います．
class FormsController < ApplicationController
  include Utility

  #
  # === GET /forms/new
  #
  # 問い合わせフォームを生成します．
  # 
  # 1. Customerを新規に生成します．
  # 2. new.html.hamlテンプレートを用いてフォームを生成します．
  #
  def new
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.haml
    end
  end

  #
  # === POST /forms
  #
  # 問い合わせフォームの内容を記録します．
  #
  # 1. 問い合わせの内容をjsonに変換します
  #    （jsonで記録することで柔軟なフォーマットに対応しています）．
  # 2. user_agentを取得します．
  # 3. conversionを記録して，emailを送信します．
  # 4. thank_youページに遷移します．
  #
  def create

    begin
      inquiry_json = {"問い合わせ" => params[:customer][:inquiry]}.to_json
      params[:customer][:inquiry] = inquiry_json

      user_agent = request.user_agent.to_s
      record_conversion_and_send_email(params, cookies, user_agent)
      
      redirect_to thank_you_form_path and return
    rescue => e
      logger.error ('コンバーションの登録・メール配信時に例外が発生しました: ' + e.message).red
      # e.backtrace.each {|l| logger.error l.red}
      redirect_to sorry_form_path and return
    end
    
  end
end
