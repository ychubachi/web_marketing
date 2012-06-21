class Browser < ActiveRecord::Base
  attr_accessible :user_agent, :uuid

  def title
    uuid
  end
end
