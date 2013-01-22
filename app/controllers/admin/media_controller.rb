class Admin::MediaController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  active_scaffold :medium do |conf|
  end
end 
