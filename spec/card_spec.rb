require "blackjack/card"

describe Card do
  it "should take a value and suit" do
    card = Card.new("s", 10)
    expect(card.suit).to eq "s"
    expect(card.score_value).to eq 10
  end

  it "non face cards should return own value" do
    non_faces = %w{2 3 4 5 6 7 8 9 10}
    non_faces.each do |v|
      card = Card.new("s", v)
      expect(card.score_value).to eq v
    end
  end

  it "face cards should all be valued at 10" do
    faces = %w{J Q K}
    faces.each do |face|
      card = Card.new("s", face)
      expect(card.score_value).to eq 10
      expect(card.value).to eq face
    end
  end

  it "an ace should be valued at 11" do
    card = Card.new("s", "A")
    expect(card.score_value).to eq 11
  end

  it "should turn a card into a string" do
    card = Card.new("s", "A")
    expect(card.to_s).to eq "As"
  end
end
