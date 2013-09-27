require './lib/Poker'

describe Hand do
  subject(:hand){ Hand.new }

  it "should be empty" do
    hand.should be_empty
  end

  xit "should have unique cards" do

  end

end