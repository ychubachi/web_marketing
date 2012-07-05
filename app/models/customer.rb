class Customer < ActiveRecord::Base
  belongs_to :browser
  attr_accessible :address, :browser_id, :inquiry, :email, :family_name, :given_name, :postal_code, :string
end
