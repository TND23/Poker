require './lib/Card'
require './lib/Deck'
require './lib/Hand'
require './lib/Player'

class Poker
  attr_accessor :deck

  def initialize
    @deck = Deck.new
  end

end
