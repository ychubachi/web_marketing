class PageView < Action
  attr_accessible :title, :url

  def title
    return "[PV]#{super}"
  end
end
