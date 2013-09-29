require './lib/Card'
require './lib/Deck'
require './lib/Hand'
require './lib/Player'

class Poker
  attr_accessor :deck, :player
  attr_reader :hand, :pot

  def initialize
    @deck = Deck.new
  end

  def play
    @player = Player.new(deck, hand, pot)
  end

end
