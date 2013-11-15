require_relative "binary_tree"

class Rack

  def initialize
    @btree = nil
  end

  def add(ball)
    initialize_or_insert(ball)
  end

  def balls
    @btree ? @btree.words : []
  end

  private

  def initialize_or_insert(value)
    if @btree
      @btree.insert(BinaryTree::Node.new(value))
    else
      @btree = BinaryTree::Node.new(value)
    end
  end
end