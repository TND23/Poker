require './lib/Poker'

describe Player do
  let(:deck) { Deck.new }
  let(:hand) { Hand.new }
  let(:pot) { Pot.new }
  subject(:player) { Player.new(deck, hand, pot) }

  it "has a hand" do
    player.hand.should_not be_nil
  end

  it "has a pot" do
    player.pot.should_not be_nil
  end

  it "pot should initialize to size 1000" do
    player.pot.size.should == 1000
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

  it "can raise" do
    player.pot = Pot.new
    player.raise(100)
    player.pot.size.should == 900
  end



end