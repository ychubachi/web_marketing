class Admin::RedirectionsController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :redirection do |conf|
    conf.columns = [:title, :code, :is_default, :medium, :target, :today, :requests, :created_at, :updated_at]
    conf.create.columns = [:code, :is_default, :medium, :target]
    conf.update.columns = [:code, :is_default, :medium, :target]
    conf.list.sorting = {created_at: 'DESC'}
  end
end 
