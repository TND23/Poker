class Hand < Array
  attr_reader :value

  def initialize
    @value = 0
  end

  def find_value
    @value = cards_worth
  end

  private

  def cards_worth
    self.sort_by! {|card| card.value}

    return 9 if royal_flush?
    return 8 if straight_flush?
    return 7 if four_of_a_kind?
    return 6 if full_house?
    return 5 if flush?
    return 4 if straight?
    return 3 if triples?
    return 2 if two_pair?
    return 1 if pair?
    return 0
  end

  def suits
    self.map(&:suit)
  end

  def values
    self.map(&:value)
  end

  def royal_flush?
    straight_flush? && values.include?(14)
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    values.any?{|value| values.count(value) == 4}
  end

  def full_house?
    triples? && values.uniq.length == 2
  end

  def flush?
    suits.uniq.length == 1
  end

  def straight?
    return true if values == [2,3,4,5,14]
    values.each_with_index do |value,index|
      next if index == 4
      return false unless value == values[index+1] - 1
    end
    true
  end

  def triples?
    values.any?{|value| values.count(value) == 3}
  end

  def two_pair?
    pair_values = []
    values.each do |val|
      pair_values << val if values.count(val) == 2 && !pair_values.include?(val)
    end
    pair_values.length == 2
  end

  def pair?
    values.any? {|value| values.count(value) == 2}
  end
end