# -*- coding: utf-8 -*-
require 'spec_helper'

describe HomeController do
  context 'GET /index', ':browserのcookieについて' do
    context 'browserのuuidがcookieにないとき' do
      it "browserのuuidをcookieに設定します．" do
        get :index
        response.cookies['web_marketing_uuid'].should match /[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}/ # uuidの正規表現
      end

      it 'browserを新規に生成します．' do
        request.cookies['web_marketing_uuid'] = nil
        request.user_agent = 'test user agent ver.0'
        expect {
          get :index
        }.to change(Browser, :count).by(1)
      end
    end

    context 'browserのuuidがcookieにあるとき' do
      it '新たなuuidは送信しません．' do
        request.cookies['web_marketing_uuid'] = 'test_browser_uuid'
        get :index
        # すでにcookieがあるので，responseで再設定することはしません．
        response.cookies['web_marketing_uuid'].should_not == 'test_browser_uuid'
      end

      it 'DBにuuidがあるbrowserのときは新しくbrowserを作成しません．' do
        browser = FactoryGirl.create(:browser)
        request.cookies['web_marketing_uuid'] = browser.uuid
        expect {
          get :index
        }.not_to change(Browser, :count)
      end
    end
  end

  describe 'GET /index' do
    it "DBにあるデフォルトのURLへリダイレクトする" do
      # ターゲットを生成します
      @target = FactoryGirl.create(:target)
      @target.save
      # デフォルトのリダイレクションを生成し，ターゲットを設定します
      @redirection = FactoryGirl.create(:redirection)
      @redirection.is_default = true
      @redirection.target = @target
      @redirection.save
      # テストします
      get 'index'
      response.should redirect_to "http://test.host/"
    end

    it 'requestがあったことを記録します．' do
      expect {
        get 'index'
      }.to change(Request, :count).by(1)
    end
  end
  
  context 'GET /index', '（異常）' do
    it "ハードコードしたURLへリダイレクトする（production以外）" do
      get 'index'
      response.should redirect_to "http://localhost:3000/lp"
    end

    it "ハードコードしたURLへリダイレクトする（production）" do
      Rails.stub(env: ActiveSupport::StringInquirer.new("production"))
      get 'index'
      response.should redirect_to "https://pr.aiit.ac.jp/lp"
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
      response.should redirect_to "http://test.host/"
    end
  end

  context 'GET /redirect', '（異常）' do
    it "DBにないIDを指定してURLへリダイレクトする" do
      get 'redirect', code: '2'
      response.should redirect_to "http://localhost:3000/lp"
    end
  end

  context 'page tracking' do
    describe 'GET /tracker' do
      it "Javascriptをレンダリングする" do
        get 'tracker'
        response.should render_template("tracker")
      end
    end

    describe 'POST /page_view' do
      it 'アクセスコントロールを得る（OPTIONS）' do
        request.stub!(:method).and_return('OPTIONS')
        request.stub!(:headers).and_return({'Origin' => 'test origin'})
        post 'page_view'
        response.headers['Access-Control-Allow-Origin'].should == 'test origin'
        response.headers['Access-Control-Allow-Credentials'] = 'true'
        response.headers['Access-Control-Allow-Method'].should == 'POST'
        response.headers['Access-Control-Allow-Headers'].should == 'origin, content-type, accept'
      end
      
      it 'requestを追加する．' do
        expect {
          post 'page_view'
        }.to change(Request, :count).by(1)
      end
      
      it '新しいpage_viewであれば追加する．' do
        expect {
          post 'page_view'
        }.to change(PageView, :count).by(1)
      end
      
      it 'すでにあるpage_viewであれば追加しない' do
        page_view = FactoryGirl.create(:page_view)
        expect {
          post 'page_view', {url: page_view.url}
        }.not_to change(PageView, :count)
      end
    end
  end
end
