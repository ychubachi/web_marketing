class Redirect < ActiveRecord::Base
  attr_accessible :code, :default_redirect, :medium_id, :target_id
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
