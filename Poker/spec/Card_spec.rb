require './lib/Poker'

describe Card do
  it "should have a value" do
    card = Card.new("S", 4)
    card.value.should == 4
  end

  it "should have a suit" do
    card = Card.new("C", 5)
    card.suit.should == "C"
  end
end