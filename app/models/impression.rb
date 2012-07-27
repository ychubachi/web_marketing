class Impression < Action
  attr_accessible :title, :display

  def title
    return "[IMP]#{(super ? super : display)}"
  end
end
