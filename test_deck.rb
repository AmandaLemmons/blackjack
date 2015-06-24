

#with blackjack just test that when you create a new deck
# or that the player and dealer both have 2 cards.

require 'minitest/autorun'
require_relative './deck'

class DeckTest < Minitest::Test

def test_full_deck
  deck = Deck.new
  assert_equal 52, deck.cards.count
end




end
