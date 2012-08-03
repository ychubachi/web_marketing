class Action < ActiveRecord::Base
  attr_accessible :type, :title
  has_many :requests

  def today
    return requests.where("created_at >= :start_date", {start_date: Date.today}).size
  end
end
