class Deck < Array

  def initialize
    create_cards
    shuffle_cards
  end

  private

  def create_cards
    suites = ["C","S","D","H"]
    values = (2..14).to_a

    suites.each do |suite|
      values.each do |value|
        self << Card.new(suite, value)
      end
    end
  end

  def shuffle_cards
    shuffle!
  end

end