class Request < ActiveRecord::Base
  attr_accessible :action_id, :env, :referred
  belongs_to :action
end
