class Action < ActiveRecord::Base
  attr_accessible :redirection_id, :page_id
  belongs_to :redirection
  belongs_to :page

  def title
    str = ""
    if redirection then
      str += "[RD]#{redirection.title} "
    end
    if page then
      str += "[PV]#{page.title} "
    end
    return str
  end
end
