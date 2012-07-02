class Admin::MediaController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :medium do |conf|
  end
end 
