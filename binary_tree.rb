module BinaryTree
  class Node
    attr_reader :word, :left, :right, :count, :count_all

    def initialize(word)
      @word = word
      @left = nil
      @right = nil
      @count = 1
      @count_all = 1
    end

    def size
      size = 1
      size += @left.size if @left
      size += @right.size if @right
      size
    end

    def all_words
      words = []

      words << self.left.all_words if self.left
      words << word_with_duplicates
      words << self.right.all_words if self.right

      words.flatten
    end

    def words
      words = []

      words << self.left.words if self.left
      words << word
      words << self.right.words if self.right

      words.flatten
    end

    def insert(node)
      self.count_all = self.count_all + 1
      insert_left(node) if node.word < word
      self.count = count + 1 if node.word == word
      insert_right(node) if node.word > word
    end

    private

    attr_writer :count_all, :left, :right, :count

    def insert_left(node)
      if self.left
        self.left.insert(node)
      else
        self.left = node
      end
    end

    def insert_right(node)
      if self.right
        self.right.insert(node)
      else
        self.right = node
      end
    end

    def word_with_duplicates
      Array.new(self.count, self.word)
    end
  end
end