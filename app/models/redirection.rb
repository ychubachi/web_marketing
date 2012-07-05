# -*- coding: utf-8 -*-
class Redirection < Action
  attr_accessible :code, :is_default, :medium_id, :target_id
  belongs_to :medium
  belongs_to :target

  def title
    if medium && target then
      "[RD]#{medium.title} ⇒ #{target.title}"
    else
      "don't know"
    end
  end
end
