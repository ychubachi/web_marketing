# -*- coding: utf-8 -*-
require 'spec_helper'

describe HomeController do
  context "GET 'index'" do
    it "DBにあるデフォルトのURLへリダイレクトする"

    it "ハードコードしたURLへリダイレクトする（production以外）" do
      get 'index'
      response.should redirect_to("http://localhost:3000/lp")
    end

    it "ハードコードしたURLへリダイレクトする（production）" do
      Rails.stub(env: ActiveSupport::StringInquirer.new("production"))
      get 'index'
      response.should redirect_to("https://pr.aiit.ac.jp/")
    end
  end

  context "GET 'redirect'" do
    it "DBにあるID指定のURLへリダイレクトする"
    it "DBにないID指定のURLへリダイレクトする"
  end
end
