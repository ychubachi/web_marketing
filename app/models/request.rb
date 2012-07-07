class Request < ActiveRecord::Base
  attr_accessible :action_id, :browser_id, :referrer
  belongs_to :browser
  belongs_to :action

  def to_label
    created_at
  end
end
