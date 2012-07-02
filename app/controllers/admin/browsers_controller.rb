class Admin::BrowsersController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :browser do |conf|
  end
end 
