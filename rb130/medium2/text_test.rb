require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample.txt')
    @string = @file.read
    @text = Text.new(@string)
  end

  def test_swap
    assert_equal @string.gsub('a', 'e'), @text.swap('a', 'e')
  end

  def test_word_count
    assert_equal @string.split.count, @text.word_count
  end


  def teardown
    @file.close
  end


end