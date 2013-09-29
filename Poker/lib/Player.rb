class Player
  attr_accessor :deck, :pot
  attr_reader :hand

  #assumes no rebuys

  def initialize(deck, hand, pot)
    @deck, @hand, @pot = deck, Hand.new, Pot.new
    draw_cards
  end

  def exchange_cards(indices)
    discard_cards(indices)
    draw_cards
  end

  def raise(amount)
    reduce_pot(amount)
  end

  private

  def draw_cards
    until hand.size == 5
      hand << deck.pop
    end
  end

  def discard_cards(indices)
    indices.each do |idx|
      hand[idx] = nil
    end

    hand.reject! { |card| card.nil? }
  end

  def reduce_pot(amount)
    pot.size -= amount
  end

end

class Pot
  attr_accessor :size
  def initialize
    @size = 1000
  end
end