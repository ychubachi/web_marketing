class Admin::MediaController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin/application'

  active_scaffold :medium do |conf|
  end
end 
