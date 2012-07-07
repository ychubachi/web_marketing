class Action < ActiveRecord::Base
  attr_accessible :type, :title
  has_many :requests
end
