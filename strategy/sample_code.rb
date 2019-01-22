# Option 1

class DisplayedCard
  attr_accessor :format, :card_data

  # Put a default format in the main class
  def initialize(format = UprightCard.new)
    @format = format
    @card_data = pick_card
  end

  def pick_card
    [
      { name: 'Sun', upright_meaning: 'brightness', reversed_meaning: 'darkness'},
      { name: 'Moon', upright_meaning: 'intuition', reversed_meaning: 'deceptiveness'},
      { name: 'Star', upright_meaning: 'hope', reversed_meaning: 'fear'}
    ].sample
  end

  # Separate the work of customization into separate classes.
  # Delegate by calling that classe's method on the instance of that class.
  def read_card
    @format.read_card(@card_data)
  end
end

class UprightCard
  def read_card(card_data)
    "Your card is the #{card_data[:name]} card, which means #{card_data[:upright_meaning]}"
  end
end

class ReversedCard
  def read_card(card_data)
    "Your card is the Reversed #{card_data[:name]} card, which means #{card_data[:reversed_meaning]}"
  end
end

# Display the default information
card = DisplayedCard.new
p card.read_card
# "Your card is Sun which means brightness"

# Display the customized information
card = DisplayedCard.new(ReversedCard.new)
p card.read_card
# "Your card is the Reversed Sun card, which means darkness"



# Option 2: Has too much coupling

class DisplayedCard
  attr_accessor :format, :card_data

  def initialize(format = UprightCard.new)
    @format = format
    @card_data = pick_card
  end

  def pick_card
    [
      { name: 'Sun', upright_meaning: 'brightness', reversed_meaning: 'darkness'},
      { name: 'Moon', upright_meaning: 'intuition', reversed_meaning: 'deceptiveness'},
      { name: 'Star', upright_meaning: 'hope', reversed_meaning: 'fear'}
    ].sample
  end

  # Passes itself into this method to give the other object access
  # to its attributes
  def read_card
    @format.read_card(self)
  end
end

class UprightCard
  def read_card(displayed_card)
    # See hom much this class has to know about the other class now?
    card = displayed_card.card_data
    "Your card is the #{card[:name]} card, which means #{card[:upright_meaning]}"
  end
end

class ReversedCard
  def read_card(displayed_card)
    card = displayed_card.card_data
    "Your card is the Reversed #{card[:name]} card, which means #{card[:reversed_meaning]}"
  end
end

# Display the default information
card = DisplayedCard.new
p card.read_card
# "Your card is Sun which means brightness"

# Display the customized information
card = DisplayedCard.new(ReversedCard.new)
p card.read_card
# "Your card is the Reversed Sun card, which means darkness"
