require './deck'
require './card'

class BlackJack
  attr_accessor :players_hand, :dealers_hand

  def initialize
    @deck = Deck.new
    @players_hand = []
    @dealers_hand = []
  end

  def show_hand(hand)
    hand.each do |card|
      puts "  #{card.name} of #{card.suit} "
    end
  end

  def preview_dealers_hand(hand)
    puts "Dealers's Hand:"
    puts "  XX"
    hand[1..-1].each do |card|
      puts "  #{card.name} of #{card.suit} "
    end
  end

  def dealing_cards
    i = 1

    while i < 5
      if i % 2 == 1
        @players_hand << @deck.cards.shift
      elsif i % 2 == 0
        @dealers_hand << @deck.cards.shift
      end
      i = i + 1
    end
  end

  def total(hand)
    hand.map{|card| card.value }.reduce(:+)
  end

  def dealer_auto_blackjack(hand)
    dealer_is_playing = true
    if total(hand) == 21
      puts "Dealer has BlackJack. Game over"
      dealer_is_playing = false
      show_hand(hand)
      exit
    end
  end


  def dealer_hit(hand)

    while total(hand) <= 16
      @dealers_hand << @deck.cards.shift
    end
  end


  def players_hit(hand)
    player_is_playing = true

    while player_is_playing

      if total(hand) == 21
        player_is_playing = false
        puts "BLACKJACK! YOU WIN!"
        break
      elsif total(hand) > 21
        player_is_playing = false
        puts "YOU BUST! GAME OVER"
        exit
      elsif (@players_hand.count >= 6) && (total(hand) < 21)
        player_is_playing = false
        puts "YOU WIN."
        exit
      end

      puts "'Hit' or 'Stay'?"

      answer = gets.downcase.chomp

      if answer == "hit"
        @players_hand << @deck.cards.shift
        show_hand(hand)
        puts total(hand)
      elsif answer == "stay"
          player_is_playing = false
      puts total(hand)
      end
    end
  end

  def results
    if (total(dealers_hand) > 21)
      puts "DEALER BUSTS, YOU WIN"
    elsif (total(players_hand) > 21)
      puts 'YOU BUST, DEALER WINS'
    elsif (total(players_hand) > total(dealers_hand)) && (total(players_hand) <= 21)
      puts "YOU WIN"
    elsif (total(dealers_hand) > total(players_hand)) && (total(dealers_hand) <= 21)
      puts "YOU LOSE, DEALER WINS!"
    elsif (total(players_hand) == total(dealers_hand))
      puts "TIE GAME!!"
    end
  end


end








blackjack = BlackJack.new
blackjack.dealing_cards
puts "Player's Hand: "
blackjack.show_hand(blackjack.players_hand)
puts
puts "Player's Total: #{blackjack.total(blackjack.players_hand)}"
puts
puts
blackjack.preview_dealers_hand(blackjack.dealers_hand)
blackjack.dealer_auto_blackjack(blackjack.dealers_hand)
puts
blackjack.players_hit(blackjack.players_hand)
puts
puts "Player's Hand: #{blackjack.total(blackjack.players_hand)}"
puts
blackjack.show_hand(blackjack.players_hand)
blackjack.dealer_hit(blackjack.dealers_hand)
puts
puts "Dealer's Hand: #{blackjack.total(blackjack.dealers_hand)}"
blackjack.show_hand(blackjack.dealers_hand)
blackjack.results
