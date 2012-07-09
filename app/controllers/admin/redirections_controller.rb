class Admin::RedirectionsController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :redirection do |conf|
    conf.columns = [:code, :title, :is_default, :requests, :created_at, :updated_at]
    conf.list.sorting = {code: 'ASC'}
  end
end 
