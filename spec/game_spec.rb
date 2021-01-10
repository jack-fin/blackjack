require "blackjack/game"
require "blackjack/player"

describe Game do
  describe "game with default deck" do
    let(:deck) { Deck.new }
    let(:dealer) { Player.new }
    let(:player) { Player.new }
    subject { described_class.new(deck, dealer, player) }

    it "initialise with default decks, dealer and player" do
      expect(subject.deck.cards.count).to eq 52 * 6
      expect(subject.player).to eq player
      expect(subject.dealer).to eq dealer
    end

    it "deals proper amount of cards to player" do
      subject.deal_cards(player, 2)
      expect(subject.player.hand.count).to eq 2
      expect(subject.dealer.hand.count).to eq 0
      expect(subject.deck.cards.count).to eq (52 * 6) - 2
    end

    it "can clear player and dealer hands" do
      subject.deal_cards(player, 2)
      subject.deal_cards(dealer, 2)
      expect(subject.player.hand.count).to eq 2
      expect(subject.dealer.hand.count).to eq 2
      subject.clear_hands
      expect(subject.player.hand.count).to eq 0
      expect(subject.dealer.hand.count).to eq 0
    end

    it "dealers turn gives the dealer 1 card" do
      expect(subject.dealer.hand.count).to eq 0
      subject.dealer_turn
      expect(subject.dealer.hand.count).to eq 1
    end

    it "players turn gives the dealer 1 card" do
      expect(subject.player.hand.count).to eq 0
      subject.player_turn
      expect(subject.player.hand.count).to eq 1
    end

    it "winner is dealer if player busts" do
      expect(subject.determine_winner(30, 20)).to eq "Dealer"
    end

    it "winner is player if dealer busts" do
      expect(subject.determine_winner(20, 30)).to eq "Player"
    end

    it "winner is both if both end on 21" do
      expect(subject.determine_winner(21, 21)).to eq "Push/Both"
    end

    it "winner is dealer if player has lower score" do
      expect(subject.determine_winner(15, 16)).to eq "Dealer"
    end

    it "winner is player if dealer has lower score" do
      expect(subject.determine_winner(16, 15)).to eq "Player"
    end
  end
end
