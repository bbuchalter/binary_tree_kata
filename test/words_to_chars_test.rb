require "test/unit"
require_relative "../words_to_chars"

class WordsToCharsTest < Test::Unit::TestCase
  def test_to_chars
    assert_equal "aaaaabbbbcccdeeeeeghhhiiiiklllllllmnnnnooopprsssstttuuvwyyyy",
                 subject.to_chars
  end

  private

  def subject
    WordsToChars.new("When not studying nuclear physics, Bambi likes to play beach volleyball.")
  end
end