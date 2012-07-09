class Admin::PageViewsController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :page_view do |conf|
    conf.columns = [:title, :url, :requests, :created_at, :updated_at]
  end
end 
