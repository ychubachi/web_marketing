class Admin::CustomersController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :customer do |conf|
  end
end 
