class Admin::ActionsController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :action do |conf|
    conf.list.columns.add :title
  end
end 
