require './lib/Poker'

describe Deck do
  subject(:deck) {Deck.new}

  it "should have 52 cards" do
    deck.size.should == 52
  end
  it "should have unique cards" do
    deck == deck.uniq
  end
  it "should be shuffled" do
    deck.should_not == Deck.new
  end
end

