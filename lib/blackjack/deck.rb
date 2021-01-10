class Deck
  attr_accessor :cards

  SUITS = %w{s h d c}
  VALUES = %w{2 3 4 5 6 7 8 9 10 J Q K A}

  def initialize(count = 6)
    @cards = build_deck(count)
  end

  def build_deck(count)
    cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end
    @cards = cards * count
    shuffle_cards
  end

  def shuffle_cards
    cards.shuffle
  end

  def needs_reshuffle
    if (@cards.count <= 52 * 2)
      return true
    end
    return false
  end

  def deal_cards(count)
    dealt_cards = cards.pop(count)

    if (needs_reshuffle)
      shuffle_cards
    end

    dealt_cards
  end
end
