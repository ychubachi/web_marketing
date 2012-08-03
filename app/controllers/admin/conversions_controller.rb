class Admin::ConversionsController < ApplicationController
  active_scaffold :conversion do |conf|
    conf.columns = [:title, :today, :requests, :created_at, :updated_at]
    conf.list.sorting = {created_at: 'DESC'}
  end
end 
