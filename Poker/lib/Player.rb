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

  def play
    puts "Would you like to check, bet, or call"
    decision = gets.chomp
    if decision == "raise"
      bet
    elsif decision == "fold"
      fold
    elsif decision == "call"
      call
    end
    "That wasn't an option"
    play
  end

  def bet(*amount)
    if amount.nil?
      puts "How much would you like to bet?"
      amount = gets.chomp.to_i
      if amount <= 0
        puts "That's not a bet."
        play
      else
        reduce_pot(amount)
      end
    elsif amount.join.to_i <= 0
      puts "That's not a bet."
      play
    else
      reduce_pot(amount.join.to_i)
    end
  end

  def call(amount)
    reduce_pot(amount)
  end

  def fold
    hand.clear
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