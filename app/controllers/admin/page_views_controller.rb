class Admin::PageViewsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  active_scaffold :page_view do |conf|
    conf.columns = [:title, :url, :today, :requests, :created_at, :updated_at]
  end
end 
