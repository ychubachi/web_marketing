require "spec_helper"

class ApplicationController < ActionController::Base
end

describe ApplicationController do
  controller do
    def index
      p 'index'
      @browser =  get_browser
      p @browser
      redirect_to '/'
    end
  end

  describe "application_controller" do
    it "get browser" do
      get :index
      assigns(:browser).should be_an_instance_of(Browser)
      response.cookies['web_marketing_uuid'].should be_an_instance_of(String)
    end
  end
end
