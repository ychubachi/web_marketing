class Browser < ActiveRecord::Base
  attr_accessible :user_agent, :uuid, :is_admin
  has_many :requests
  has_many :customers

  def title
    if is_admin then
      '*' + user_agent
    else
      uuid
    end
  end
end
