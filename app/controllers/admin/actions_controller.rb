class Admin::ActionsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin/application'

  active_scaffold :action do |conf|
    conf.columns = [:type, :title, :today, :requests, :created_at, :updated_at]
    conf.list.sorting = {type: 'ASC'}
    conf.sti_children = [:redirection, :page_view, :conversion]
  end
end 
