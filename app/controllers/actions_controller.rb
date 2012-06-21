class ActionsController < ApplicationController
  active_scaffold :action do |conf|
    conf.list.columns.add :title
  end
end 
