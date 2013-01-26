class Admin::BrowsersController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin/application'

  active_scaffold :browser do |conf|
    conf.columns = [:uuid, :user_agent, :is_admin, :customers, :requests, :created_at, :updated_at]
    conf.list.sorting = {created_at: 'DESC'}
  end
end 
