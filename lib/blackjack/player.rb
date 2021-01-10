class Player
  attr_accessor :hand, :score

  def initialize
    @hand = []
  end

  def clear_hand
    @hand = []
  end

  def hit(deck, count)
    @hand += deck.deal_cards(count)
  end

  def score
    score_total = hand.inject(0) { |sum, card| sum += card.score_value.to_i }
    total_aces = hand.inject(0) { |sum, card| (card.value == "A") ? sum + 1 : sum }
    # Handle a score that is more than 21, but has Aces which can be 1 or 11
    # puts("Score total #{score_total}, total aces: #{total_aces}")
    while (total_aces > 0)
      if (score_total > 21)
        score_total -= 10
      end
      total_aces -= 1
    end
    score_total
  end

  def print_hand
    hand_string = ""
    @hand.each do |card|
      hand_string << " #{card.to_s}"
    end
    return hand_string
  end
end
