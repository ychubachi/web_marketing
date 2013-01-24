class Form < ActiveRecord::Base
  attr_accessible :address, :browser_id, :email, :family_name, :given_name, :inquire, :postal_code_code
end
