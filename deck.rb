require './card'
require 'pp'

  class Deck

  def initialize
    @cards = []
    suits = [:hearts, :diamonds, :spades, :clubs]
    suits.each do |suit|
      (2..10).each do |value|
        @cards << Card.new(suit, value)
      end
      @cards << Card.new(suit, "J")
      @cards << Card.new(suit, "Q")
      @cards << Card.new(suit, "K")
      @cards << Card.new(suit, "A")
    end

    @cards.shuffle!

  end

  def cards
    @cards
  end


end

deck = Deck.new

#
# puts deck.cards.inspect
# puts deck.cards.length
