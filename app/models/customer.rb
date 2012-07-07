class Customer < ActiveRecord::Base
  attr_accessible :address, :browser_id, :inquiry, :email, :family_name, :given_name, :postal_code
  belongs_to :browser
end
