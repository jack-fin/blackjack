require_relative "./blackjack/card"
require_relative "./blackjack/deck"
require_relative "./blackjack/game"
require_relative "./blackjack/player"

def single_round
  deck = Deck.new
  dealer = Player.new
  player = Player.new

  game = Game.new(deck, dealer, player)
  hand_counter = 1

  game.play_hand(hand_counter)
end

def play_until_shuffle
  deck = Deck.new
  dealer = Player.new
  player = Player.new

  game = Game.new(deck, dealer, player)
  hand_counter = 1

  while (!deck.needs_reshuffle)
    game.play_hand(hand_counter)
    hand_counter += 1
  end
end
