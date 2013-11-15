require_relative "binary_tree"

class WordsToChars
  def initialize(words)
    @words = words
    build_btree
  end

  def to_chars
    btree.all_words.join("")
  end

  def sanitized_words
    words.downcase
  end

  private

  attr_reader :words, :btree

  def build_btree
    sanitized_words.scan(/[a-z]/).each do |char|
      initialize_or_insert(char)
    end
  end

  def initialize_or_insert(value)
    if @btree
      @btree.insert(BinaryTree::Node.new(value))
    else
      @btree = BinaryTree::Node.new(value)
    end
  end
end