class Game
  attr_reader :deck, :dealer, :player

  def initialize(deck, dealer, player)
    @deck = deck
    @dealer = dealer
    @player = player
  end

  def clear_hands
    dealer.clear_hand
    player.clear_hand
  end

  def play_hand(round_number)
    # Initial dealing of 2 cards
    dealer.hit(@deck, 2)
    player.hit(@deck, 2)

    # Check for Blackjack, score of 21 on first 2 cards
    if (dealer.score == 21 || player.score == 21)
      print_round(round_number)
    else
      while can_play_dealer? || can_play_player?
        dealer_turn if can_play_dealer?
        player_turn if can_play_player?
      end

      print_round(round_number)
    end

    clear_hands
  end

  def print_round(round_number)
    puts "ROUND #{round_number} WINNER: #{determine_winner(player.score, dealer.score)}"
    puts "DEALER SCORE: #{dealer.score} HAND:#{dealer.print_hand}"
    puts "PLAYER SCORE: #{player.score} HAND:#{player.print_hand}"
    puts ""
  end

  def deal_cards(user, count)
    user.hit(@deck, count)
  end

  def can_play_dealer?
    dealer.score < 16
  end

  def can_play_player?
    player.score < 16
  end

  def dealer_turn
    deal_cards(dealer, 1) if dealer.score < 16
  end

  def player_turn
    deal_cards(player, 1) if player.score < 16
  end

  def determine_winner(player_value, dealer_value)
    return "Dealer" if player_value > 21
    return "Player" if dealer_value > 21

    if player_value === dealer_value
      "Push/Both"
    elsif player_value > dealer_value
      "Player"
    else
      "Dealer"
    end
  end
end
