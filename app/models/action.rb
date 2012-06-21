class Action < ActiveRecord::Base
  attr_accessible :convertion_id, :redirect_id
  belongs_to :redirect
  belongs_to :convertion

  def title
    str = ""
    if redirect then
      str += "[RD]#{redirect.title} "
    end
    if convertion then
      str += "[CV]#{convertion.title} "
    end
    return str
  end
end
