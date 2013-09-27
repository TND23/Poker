require './lib/Poker'

describe Player do
  let(:deck) { Deck.new }
  let(:hand) { Hand.new }
  subject(:player) { Player.new(deck, hand) }

  it "has a hand" do
    player.hand.should_not be_nil
  end

  it "has a deck" do
    player.deck.should_not be_nil
  end

  it "holds five cards" do
    player.hand.size.should == 5
  end

  it "can exchange cards" do
    old_hand = player.hand.dup
    player.exchange_cards([4])
    player.hand.should_not == old_hand
  end



end