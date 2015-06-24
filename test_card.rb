require 'minitest/autorun'
require_relative './card'

class CardTest < Minitest::Test

  def test_value
    card = Card.new(:hearts, "J")
    assert_equal 10, card.value
  end

  def test_number
    card = Card.new(:hearts, "7")
    assert_equal 7, card.value
  end

  def test_a
    card = Card.new(:hearts, "A")
    assert_equal 11, card.value
  end



end
