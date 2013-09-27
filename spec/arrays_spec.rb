require './lib/arrays.rb'

describe "#my_uniq" do
  it "should return an empty array" do
    [].my_uniq.should == []
  end

  it "should return a one-element array" do
    [1].my_uniq.should == [1]
  end

  it "should not call uniq" do
    array = [1,2,3]
    array.should_not_receive(:uniq)
    array.my_uniq
  end

  it "should not remove duplicates" do
    [1,2,1,3,3].my_uniq.should == [1,2,3]
  end

  it "shouldn ot modify original" do
    array = [1,2,1,3,3]
    array.my_uniq
    array.should == [1,2,1,3,3]
  end

end

describe "#two_sum" do
  it "should return an empty array" do
    [].two_sum.should == []
  end

  it "should find one pair" do
    [1, 0, -1].two_sum.should == [[0, 2]]
  end

  it "should find multiple pairs" do
    [-1, 0, 2, -2, 1].two_sum.should == [[0, 4], [2, 3]]
  end

  it "should return correctly with zeroes" do
    [0, 0, 0].two_sum.should == [[0, 1], [0, 2], [1, 2]]
  end

end

describe "Towers of Hanoi" do
  subject(:toh) {TowersOfHanoi.new}

  describe "#move" do
    it "moves from the first stack" do
      toh.move([0,2])
      toh.arrays.should == [[4,3,2],[],[1]]
    end

    it "won't put a larger disk on a smaller one" do
      2.times{toh.move([0,2])}
      toh.arrays.should == [[4,3,2],[],[1]]
    end
  end

  describe "#won?" do
    it "knows when the game is won" do
      toh.arrays = [[],[], [4,3,2,1]]
      toh.should be_won
    end
  end

end