require './lib/Poker'

describe Poker do

  subject(:game){Poker.new}

  it "should have a full deck" do
    game.deck.size.should == 52
  end

  it "should know whose turn it is" do

  end

end
