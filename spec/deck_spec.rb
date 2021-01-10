require "blackjack/card"
require "blackjack/deck"

describe Deck do
  it "has an array of suits" do
    expect(Deck::SUITS).to eq %w[s h d c]
  end

  it "has values" do
    expect(Deck::VALUES).to eq %w[2 3 4 5 6 7 8 9 10 J Q K A]
  end

  it "initialise with a default deck of 6 decks" do
    expect(subject.cards.count).to eq 52 * 6
  end

  it "initialise with a 1 deck of cards" do
    deck = Deck.new(1)
    expect(deck.cards.count).to eq 52
  end

  it "after dealing out less than 4 decks, no reshuffle" do
    deck = Deck.new
    player = Player.new()

    expect(deck).not_to receive(:shuffle_cards)
    player.hit(deck, (52 * 4) - 1)
  end

  it "after dealing out 4 decks, reshuffle" do
    deck = Deck.new
    player = Player.new()

    expect(deck).to receive(:shuffle_cards)
    player.hit(deck, 52 * 4)
  end
end
