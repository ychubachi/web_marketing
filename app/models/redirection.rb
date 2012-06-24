class Redirection < ActiveRecord::Base
  attr_accessible :code, :is_default, :medium_id, :target_id
  belongs_to :medium
  belongs_to :target

  def title
    if medium && target then
      "#{medium.title} => #{target.title}"
    else
      nil
    end
  end
end
