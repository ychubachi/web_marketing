class Conversion < Action
  attr_accessible :title

  def title
    return "[CV]#{super}"
  end
end
