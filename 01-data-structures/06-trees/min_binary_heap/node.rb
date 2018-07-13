class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right

  def initialize(title, rating)
    @title = title
    @rating = rating
    @left = nil
    @right = nil
  end

  def <=>(node)
    @rating <=> node.rating
  end

  def >=(node)
    @rating >= node.rating
  end

  def <=(node)
    @rating <= node.rating
  end
end