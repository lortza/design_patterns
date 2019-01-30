# CODE AS PROCS

# Pros: We don't need to define a whole other class just to pass this custom method.
# It's stored in a constant, so it's lightweight and easy to understand.

class DisplayedCard
  attr_accessor :format, :card_data

  # Initialize the class with a block instead of another class dependency
  def initialize(&formatter_block)
    @formatter = formatter_block
    @card_data = pick_card
  end

  def pick_card
    [
      { name: 'Sun', upright_meaning: 'brightness', reversed_meaning: 'darkness'},
      { name: 'Moon', upright_meaning: 'intuition', reversed_meaning: 'deceptiveness'},
      { name: 'Star', upright_meaning: 'hope', reversed_meaning: 'fear'}
    ].sample
  end

  # Call the block, passing it the data it needs
  def read_card
    @formatter.call(@card_data)
  end

end

# Store those customized methods as procs instead of a method within a class. Process the argument as you normally would. 
UPRIGHT = lambda { |card_data| "Your card is the #{card_data[:name]} card, which means #{card_data[:upright_meaning]}" }
REVERSED = lambda { |card_data| "Your card is the Reversed #{card_data[:name]} card, which means #{card_data[:reversed_meaning]}" }

card = DisplayedCard.new(&UPRIGHT)
p card.read_card
# "Your card is Sun which means brightness"

card = DisplayedCard.new(&REVERSED)
p card.read_card
# "Your card is the Reversed Sun card, which means darkness"
