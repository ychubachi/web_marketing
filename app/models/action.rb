class Action < ActiveRecord::Base
  attr_accessible :convertion_id, :redirection_id
  belongs_to :redirection
  belongs_to :convertion

  def title
    str = ""
    if redirection then
      str += "[RD]#{redirection.title} "
    end
    if convertion then
      str += "[CV]#{convertion.title} "
    end
    return str
  end
end
