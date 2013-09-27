class Player
  attr_accessor :deck
  attr_reader :hand

  def initialize(deck, hand)
    @deck, @hand = deck, Hand.new
    draw_cards
  end

  def exchange_cards(indices)
    discard_cards(indices)
    draw_cards
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
end