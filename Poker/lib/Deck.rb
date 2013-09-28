class Deck < Array

  def initialize
    create_cards
    shuffle_cards
  end

  private

  def create_cards
    suits = ["C","S","D","H"]
    values = (2..14).to_a

    suits.each do |suit|
      values.each do |value|
        self << Card.new(suit, value)
      end
    end
  end

  def shuffle_cards
    shuffle!
  end

end