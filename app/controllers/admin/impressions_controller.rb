class Admin::ImpressionsController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :impression do |conf|
    conf.columns = [:title, :display, :created_at, :updated_at]
  end
end 
