require 'minitest/autorun'
require './blackjack_hard.rb'
require 'minitest/pride'

class BlackjackTest < Minitest::Test

   def test_dealer_hand
    blackjack = BlackJack.new
    assert_equal 2, blackjack.dealing_cards.count
  end


end
