require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "should redirect_to ..." do
      get 'index'
      response.should redirect_to("http://aiit.ac.jp/")
    end
  end

end
