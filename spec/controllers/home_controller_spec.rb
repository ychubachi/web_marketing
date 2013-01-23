# -*- coding: utf-8 -*-
require 'spec_helper'

describe HomeController do
  describe 'GET /index' do
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
      assigns(:my_request).should be_a(Request)
      assigns(:my_request).action.should be_a(Action)
      assigns(:my_request).browser.should be_a(Browser)
      response.should redirect_to "http://test.host/"
    end
  end
  
  context 'GET /index', '（異常）' do
    it "ハードコードしたURLへリダイレクトする（production以外）" do
      get 'index'
      response.should redirect_to "http://localhost:3000/lp"
      assigns(:my_request).should be_nil
    end

    it "ハードコードしたURLへリダイレクトする（production）" do
      Rails.stub(env: ActiveSupport::StringInquirer.new("production"))
      get 'index'
      response.should redirect_to "https://pr.aiit.ac.jp/lp"
      assigns(:my_request).should be_nil
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
      assigns(:my_request).should be_nil
    end
  end

  context 'GET /redirect' do
    it "IDを指定してURLへリダイレクトする" do
      # ターゲットを生成します
      @target = FactoryGirl.create(:target)
      @target.save
      # リダイレクションを生成し，ターゲットを設定します
      @redirection = FactoryGirl.create(:redirection)
      @redirection.target = @target
      @redirection.save
      # テストします
      get 'redirect', code: '1'
      assigns(:my_request).should be_a(Request)
      assigns(:my_request).action.should be_a(Action)
      assigns(:my_request).browser.should be_a(Browser)
      response.should redirect_to "http://test.host/"
    end
  end

  context 'GET /redirect', '（異常）' do
    it "DBにないIDを指定してURLへリダイレクトする" do
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
      assigns(:my_request).should be_nil
    end
  end

  describe "GET '/tracker'" do
    it "Javascriptをレンダリングする" do
      get 'tracker'
      response.should render_template("tracker")
    end
  end
end
