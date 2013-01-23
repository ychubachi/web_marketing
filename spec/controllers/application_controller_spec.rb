# -*- coding: utf-8 -*-
require "spec_helper"

class ApplicationController < ActionController::Base
end

describe ApplicationController do
  controller do
    def index
      @browser =  get_browser
      redirect_to '/'
    end
  end

  it "browserのuuidを生成します．" do
    get :index
    assigns(:browser_uuid).should match /[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}/
  end

  it "browserのuuidをcookieに設定します．" do
    get :index
    response.cookies['web_marketing_uuid'].should == assigns(:browser_uuid)
  end

  it 'browserをDBから検索します．' do
    get :index
    assigns(:browser).should be_an_instance_of(Browser)
  end
end
