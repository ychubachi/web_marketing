class Browser < ActiveRecord::Base
  attr_accessible :user_agent, :uuid, :is_admin
  belongs_to :customer
  has_many :requests, dependent: :delete_all
  has_many :forms, dependent: :delete_all

  def title
    if is_admin then
      '*' + user_agent
    else
      uuid
    end
  end
end
