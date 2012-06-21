require 'spec_helper'

describe RedirectorController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'redirect'" do
    it "returns http success" do
      get 'redirect'
      response.should be_success
    end
  end

end
