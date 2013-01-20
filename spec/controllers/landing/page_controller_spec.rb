require 'spec_helper'

describe Landing::PageController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "sends an email"
  end

end
