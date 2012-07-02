class Admin::TargetsController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :target do |conf|
  end
end 
