class Admin::TargetsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin/application'

  active_scaffold :target do |conf|
  end
end 
