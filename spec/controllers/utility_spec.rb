# -*- coding: utf-8 -*-
require "spec_helper"

require 'logger'

class DummyUtility
  include Utility
end

describe 'Utility' do

  before(:each) do
    @dummy_utility = DummyUtility.new
    @dummy_utility.stub!(:logger).and_return(Rails.logger)
  end
  
  describe 'read_or_create_uuid(cookie)' do

    it 'cookieにuuidがない場合，新規に生成します．' do
      uuid = @dummy_utility.read_or_create_uuid(cookies)
      uuid.should match /[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}/ # uuidの正規表現
    end

    it 'cookieにすでにuuidがある場合，そのuuidを返します．' do
      cookies[:web_marketing_uuid] = {
        value: 'dummy_uuid',
        expires: 365.days.from_now }
      uuid = @dummy_utility.read_or_create_uuid(cookies)
      uuid.should eq 'dummy_uuid'
    end
  end

  describe 'read_or_create_browser(browser_uuid)' do
    it '新しいuuidを持つブラウザを登録します．' do
      browser = nil
      expect {
        browser = @dummy_utility.read_or_create_browser('test_uuid',
                                                        'test_agent')
      }.to change(Browser, :count).by(1)
      browser.should be_a(Browser)
    end

    it 'すでにあるuuidを持つブラウザを登録します．' do
      browser1 = FactoryGirl.create(:browser)
      browser2 = nil
      expect {
        browser2 = @dummy_utility.read_or_create_browser(browser1.uuid,
                                                        'test_agent')
      }.not_to change(Browser, :count)
      browser2.should == browser1
    end
  end

  describe 'read_or_create_conversion(title)' do
    it '新しいtitleを持つコンバーションを登録します．' do
      conversion = nil
      expect {
        conversion = @dummy_utility.read_or_create_conversion('Conversion')
      }.to change(Conversion, :count).by(1)
      conversion.should be_a(Conversion)
    end
    
    it 'すでにあるtitleを持つコンバーションを検索します．' do
      conversion1 = FactoryGirl.create(:conversion)
      conversion2 = nil
      expect {
        # conversion1.title は，AS用にオーバライドされています．
        conversion2 = @dummy_utility.read_or_create_conversion('Conversion')
      }.not_to change(Conversion, :count)
      conversion2.should == conversion1
    end
  end

  describe 'create_request(browser, action)' do
    it 'browserとconversionアクションを設定したリクエストを登録します．' do
      browser = FactoryGirl.create(:browser)
      conversion = FactoryGirl.create(:conversion)
      request = nil;
      expect {
        request = @dummy_utility.create_request(browser, conversion)
      }.to change(Request, :count).by(1)
      request.should be_a(Request)
    end
  end

  describe 'create_default_redirection' do
    it 'デフォルトのリダイレクションを作成します' do
      redirection = @dummy_utility.create_default_redirection
      redirection.should be_a(Redirection)
    end
  end

  describe 'read_or_create_page_view' do
    it 'ページビューを記録します' do
      expect {
        @dummy_utility.read_or_create_page_view('http://test/test',
                                                'test title')
      }.to change(PageView, :count).by(1)
    end
  end

  describe 'get_browser_from(cookies)' do
    it 'cookiesとuser_agentからbrowserを取得します．' do
      # 以下を結合したメソッドです．
      # - read_or_create_uuid(cookies)
      # - read_or_create_browser(uuid, user_agent)
      browser = @dummy_utility.get_browser_from(cookies, 'test agent')
      browser.should be_a(Browser)
    end
  end

  describe 'TODO:' do
    it 'customerのinquryを削除します'
  end
end
