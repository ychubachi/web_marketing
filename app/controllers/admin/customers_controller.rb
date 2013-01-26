class Admin::CustomersController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin/application'

  active_scaffold :customer do |conf|
    conf.columns = [:family_name, :given_name, :email, :postal_code, :address, :parsed_inquiry, :browser, :created_at, :updated_at]
  end
end 
