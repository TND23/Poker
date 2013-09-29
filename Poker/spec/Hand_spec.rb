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
    pair_hand = Hand.new.clear
    pair_hand << Card.new("C",13) << Card.new("S",13) << Card.new("H",6)
    pair_hand << Card.new("D",9) << Card.new("H",11)
    pair_hand.find_value.should == 1
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
    straight_hand = Hand.new.clear
    straight_hand << Card.new("C",13) << Card.new("S",12) << Card.new("H",10)
    straight_hand << Card.new("D",9) << Card.new("H",11)
    straight_hand.find_value.should == 4
  end

  it "knows straight" do
    straight_hand = Hand.new.clear
    straight_hand << Card.new("C",14) << Card.new("S",2) << Card.new("H",3)
    straight_hand << Card.new("D",4) << Card.new("H",5)
    straight_hand.find_value.should == 4
  end

  it "knows flush" do
    flush_hand = Hand.new.clear
    flush_hand << Card.new("C",13) << Card.new("C",6) << Card.new("C",8)
    flush_hand << Card.new("C",9) << Card.new("C",4)
    flush_hand.find_value.should == 5
  end

  it "knows full house" do
    full_house_hand = Hand.new.clear
    full_house_hand << Card.new("C",13) << Card.new("S",13) << Card.new("H",13)
    full_house_hand << Card.new("D",9) << Card.new("H",9)
    full_house_hand.find_value.should == 6
  end

  it "knows four of a kind" do
    quads_hand = Hand.new.clear
    quads_hand << Card.new("C",13) << Card.new("S",13) << Card.new("H",13)
    quads_hand << Card.new("D",13) << Card.new("H",11)
    quads_hand.find_value.should == 7
  end

  it "knows straight flush" do
    straight_flush_hand = Hand.new.clear
    straight_flush_hand << Card.new("D",5) << Card.new("D",6) << Card.new("D",7)
    straight_flush_hand << Card.new("D",8) << Card.new("D",9)
    straight_flush_hand.find_value.should == 8
  end

  it "knows royal flush" do
    royal_flush_hand = Hand.new.clear
    royal_flush_hand << Card.new("C",10) << Card.new("C",11) << Card.new("C",12)
    royal_flush_hand << Card.new("C",13) << Card.new("C",14)
    royal_flush_hand.find_value.should == 9
  end

  it "can compare clear wins" do
    full_house_hand = Hand.new.clear
    full_house_hand << Card.new("C",13) << Card.new("S",13) << Card.new("H",13)
    full_house_hand << Card.new("D",9) << Card.new("H",9)

    triples_hand = Hand.new.clear
    triples_hand << Card.new("C",13) << Card.new("S",13) << Card.new("H",13)
    triples_hand << Card.new("D",9) << Card.new("H",11)
    triples_hand.find_value.should < full_house_hand.find_value
  end

  describe "it can compare subtle wins" do

    it "can distinguish between full houses" do
      hand_one = Hand.new.clear
      hand_one << Card.new("C",13) << Card.new("S",13) <<Card.new("H",13)
      hand_one << Card.new("D",9) << Card.new("H",9)

      hand_two = Hand.new.clear
      hand_two << Card.new("C",12) << Card.new("S",12) << Card.new("H",12)
      hand_two << Card.new("D",10) << Card.new("H",10)

      Hand.winner(hand_one, hand_two).should == hand_one
    end

    it "can compare straight flushes" do
      s_flush_one = Hand.new.clear
      s_flush_one << Card.new("D",5) << Card.new("D",6) << Card.new("D",7)
      s_flush_one << Card.new("D",8) << Card.new("D",9)

      s_flush_two = Hand.new.clear
      s_flush_two << Card.new("C",8) << Card.new("C",9) << Card.new("C",10)
      s_flush_two << Card.new("C",11) << Card.new("C",12)

      Hand.winner(s_flush_one, s_flush_two).should == s_flush_two
    end


    it "can compare high card winners" do
      high_card_one = Hand.new.clear
      high_card_one << Card.new("D",5) << Card.new("C",8) << Card.new("S",9)
      high_card_one << Card.new("D",11) << Card.new("H",12)

      high_card_two = Hand.new.clear
      high_card_two << Card.new("S",2) << Card.new("H",3) << Card.new("H",5)
      high_card_two << Card.new("D",7) << Card.new("C",13)

      Hand.winner(high_card_one, high_card_two).should == high_card_two
    end
  end
end