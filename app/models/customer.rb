class Customer < ActiveRecord::Base
  attr_accessible :family_name, :given_name, :email, :postal_code, :address, :inquiry
  belongs_to :browser
  has_many :forms, dependent: :delete_all

  def to_label
    "#{family_name} #{given_name}"
  end

  def parsed_inquiry
    json = JSON.parse inquiry
  end
end
