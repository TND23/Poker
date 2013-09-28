require './lib/Poker'

describe Hand do
  subject(:hand){ Hand.new }

  it "should be empty" do
    hand.should be_empty
  end

  it "should have a value" do
    hand.value.should >= 0
  end

  it "finds its value" do
    hand.find_value.should >= 0
  end

  it "knows one pair" do
    triples_hand = Hand.new.clear
    triples_hand << Card.new("C",13) << Card.new("S",13) << Card.new("H",6)
    triples_hand << Card.new("D",9) << Card.new("H",11)
    triples_hand.find_value.should == 1
  end

  it "knows two-pair value" do
    two_pair_hand = Hand.new.clear
    two_pair_hand << Card.new("C",13) << Card.new("S",13) << Card.new("H",9)
    two_pair_hand << Card.new("D",9) << Card.new("H",11)
    two_pair_hand.find_value.should == 2
  end

  it "knows triples" do
    triples_hand = Hand.new.clear
    triples_hand << Card.new("C",13) << Card.new("S",13) << Card.new("H",13)
    triples_hand << Card.new("D",9) << Card.new("H",11)
    triples_hand.find_value.should == 3
  end


  it "knows straight" do
    triples_hand = Hand.new.clear
    triples_hand << Card.new("C",13) << Card.new("S",12) << Card.new("H",10)
    triples_hand << Card.new("D",9) << Card.new("H",11)
    triples_hand.find_value.should == 4
  end

  it "knows straight" do
    triples_hand = Hand.new.clear
    triples_hand << Card.new("C",14) << Card.new("S",2) << Card.new("H",3)
    triples_hand << Card.new("D",4) << Card.new("H",5)
    triples_hand.find_value.should == 4
  end

  it "knows flush" do
    triples_hand = Hand.new.clear
    triples_hand << Card.new("C",13) << Card.new("C",6) << Card.new("C",8)
    triples_hand << Card.new("C",9) << Card.new("C",4)
    triples_hand.find_value.should == 5
  end

  it "knows full house" do
    triples_hand = Hand.new.clear
    triples_hand << Card.new("C",13) << Card.new("S",13) << Card.new("H",13)
    triples_hand << Card.new("D",9) << Card.new("H",9)
    triples_hand.find_value.should == 6
  end

  it "knows four of a kind" do
    triples_hand = Hand.new.clear
    triples_hand << Card.new("C",13) << Card.new("S",13) << Card.new("H",13)
    triples_hand << Card.new("D",13) << Card.new("H",11)
    triples_hand.find_value.should == 7
  end

  it "knows straight flush" do
    triples_hand = Hand.new.clear
    triples_hand << Card.new("D",5) << Card.new("D",6) << Card.new("D",7)
    triples_hand << Card.new("D",8) << Card.new("D",9)
    triples_hand.find_value.should == 8
  end

  it "knows straight flush" do
    triples_hand = Hand.new.clear
    triples_hand << Card.new("C",10) << Card.new("C",11) << Card.new("C",12)
    triples_hand << Card.new("C",13) << Card.new("C",14)
    triples_hand.find_value.should == 9
  end

end