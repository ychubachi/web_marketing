class Request < ActiveRecord::Base
  attr_accessible :action_id, :env, :referrer
  belongs_to :browser
  belongs_to :action
end
