# -*- coding: utf-8 -*-
require "spec_helper"

class ApplicationController < ActionController::Base
end

describe ApplicationController do
  controller do
    def index
      search_browser
      redirect_to '/'
    end
  end

  context 'get_browser' do
    context 'browserのuuidがcookieにないとき' do
      it "browserのuuidを新たに生成します．" do
        get :index
        assigns(:browser_uuid).should match /[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}/
      end

      it "browserのuuidをcookieに設定します．" do
        get :index
        response.cookies['web_marketing_uuid'].should == assigns(:browser_uuid)
      end

      it 'browserを新規に生成します．' do
        request.user_agent = 'test user agent ver.0'
        get :index
        assigns(:browser).should be_an_instance_of Browser
        assigns(:browser).uuid.should == response.cookies['web_marketing_uuid']
        assigns(:browser).user_agent.should == 'test user agent ver.0'
      end
    end

    context 'browserのuuidがcookieにあるとき' do
      it '新たなuuidは生成しません．' do
        request.cookies['web_marketing_uuid'] = 'test_browser_uuid'
        get :index
        assigns(:browser_uuid).should == 'test_browser_uuid'
        # すでにcookieがあるので，responseで再設定することはしません．
        response.cookies['web_marketing_uuid'].should_not == 'test_browser_uuid'
      end

      it 'uuidが示すbrowserを検索します．' do
        browser = FactoryGirl.create(:browser)
        browser.save
        request.cookies['web_marketing_uuid'] = 'test_browser_uuid'
        get :index
        assigns(:browser).should eq browser
      end
    end
  end
end
