class Admin::CustomersController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  active_scaffold :customer do |conf|
  end
end 
