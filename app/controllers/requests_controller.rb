class RequestsController < ApplicationController
  active_scaffold :request do |conf|
    conf.list.columns.add :action
  end
end 
