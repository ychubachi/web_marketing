# -*- coding: utf-8 -*-
require 'spec_helper'

describe HomeController do
  describe "GET 'index'" do
    @my_url_test = "http://localhost:3000/lp"
    @url_production = "https://pr.aiit.ac.jp/"

    it "てすとだよばかばかあほあほ"

    it "ハードコードしたURLへリダイレクトする（production以外）" do
      get 'index'
      response.should redirect_to "http://localhost:3000/lp"
    end

    it "ハードコードしたURLへリダイレクトする（production）" do
      Rails.stub(env: ActiveSupport::StringInquirer.new("production"))
      get 'index'
      response.should redirect_to "https://pr.aiit.ac.jp/"
    end
    
    it "DBにあるデフォルトのURLへリダイレクトする" do
      # ターゲットを生成します
      @target = FactoryGirl.create(:target)
      @target.save
      # リダイレクションを生成し，ターゲットを設定します
      @redirection = FactoryGirl.create(:redirection)
      @redirection.is_default = true
      @redirection.target = @target
      @redirection.save
      # テストします
      get 'index'
      response.should redirect_to "http://test.host/"
    end
    
    it "DBにデフォルトのURLがない場合，ハードコードしたURLにリダイレクトする" do
      # ターゲットを生成します
      @target = FactoryGirl.create(:target)
      @target.save
      # リダイレクションを生成し，ターゲットを設定します
      @redirection = FactoryGirl.create(:redirection)
      @redirection.is_default = false # デフォルトをなしに設定します
      @redirection.target = @target
      @redirection.save
      # テストします
      get 'index'
      response.should redirect_to "http://localhost:3000/lp"
    end
  end

  describe "GET 'redirect'" do
    it "IDを指定してURLへリダイレクトする（正常）" do
      # ターゲットを生成します
      @target = FactoryGirl.create(:target)
      @target.save
      # リダイレクションを生成し，ターゲットを設定します
      @redirection = FactoryGirl.create(:redirection)
      @redirection.target = @target
      @redirection.save
      # テストします
      get 'redirect', code: '1'
      response.should redirect_to "http://test.host/"
    end

    it "DBにないIDを指定してURLへリダイレクトする（例外）" do
      # ターゲットを生成します
      @target = FactoryGirl.create(:target)
      @target.save
      # リダイレクションを生成し，ターゲットを設定します
      @redirection = FactoryGirl.create(:redirection)
      @redirection.is_default = true
      @redirection.target = @target
      @redirection.save
      # テストします
      get 'redirect', code: '2'
      response.should redirect_to "http://localhost:3000/lp"
    end
  end
end
