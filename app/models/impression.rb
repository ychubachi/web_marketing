class Impression < Action
  attr_accessible :title, :display

  def title
    return "[IP]#{display}"
  end
end
