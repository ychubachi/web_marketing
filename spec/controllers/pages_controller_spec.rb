# -*- coding: utf-8 -*-
require 'spec_helper'

describe PagesController do

  def valid_attributes
    {"customer"=>{
        "family_name"=>"Family",
        "given_name"=>"Given",
        "email"=>"test@example.com",
        "postal_code"=>"000-0000",
        "address"=>"Somewhere",
        "inquiry"=>"[\"inquiry1\",\"inquiry2\"]"},
      "comment"=>"コメント\r\nテスト",
      "guidance"=>"test"}
  end
  
  def valid_session
    {}
  end
   
  describe "GET 'new'" do
    it "http successが戻ります．" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "sends an email" do
      customer = FactoryGirl.create(:customer)
      post 'create', valid_attributes
      response.should redirect_to '/page/thank_you'
    end
  end

end
