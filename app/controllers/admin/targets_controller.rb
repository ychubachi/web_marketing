class Admin::TargetsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  active_scaffold :target do |conf|
  end
end 
