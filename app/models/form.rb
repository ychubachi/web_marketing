class Form < ActiveRecord::Base
  attr_accessible :address, :browser_id, :email, :family_name, :given_name, :inquiry, :postal_code
  belongs_to :browser
  belongs_to :customer
end
