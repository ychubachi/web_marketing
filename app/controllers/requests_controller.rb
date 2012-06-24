class RequestsController < ApplicationController
  active_scaffold :request do |conf|
    conf.list.columns.add :action
    list.sorting = {created_at: 'DESC'}
  end
end 
