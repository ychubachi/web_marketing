class Admin::RequestsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  active_scaffold :request do |conf|
    conf.columns = [:browser, :action, :referrer, :created_at, :updated_at]
    conf.list.sorting = {created_at: 'DESC'}
  end
end 
