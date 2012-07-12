class Admin::RedirectionsController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :redirection do |conf|
    conf.columns = [:code, :is_default, :medium, :target, :requests, :created_at, :updated_at]
    conf.list.sorting = {code: 'DESC'}
  end
end 
