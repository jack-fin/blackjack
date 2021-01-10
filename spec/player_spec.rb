require "blackjack/player"

describe Player do
  it "should calculate a players hand value" do
    deck = Deck.new(1)
    player = Player.new()
    player.hit(deck, 4)
    expect(player.score).to be > 0
  end

  it "should handle Aces being 11 or 1" do
    player = Player.new()
    player.hand = [Card.new("d", "A"), Card.new("d", "A")]
    expect(player.score).to be 12

    player.hand = [Card.new("d", "A"), Card.new("d", "A"), Card.new("d", "A")]
    expect(player.score).to be 13
  end

  it "can print a hand" do
    player = Player.new()
    player.hand = [Card.new("d", "J"), Card.new("h", "A")]
    expect(player.print_hand).to eq " Jd Ah"
  end
end
