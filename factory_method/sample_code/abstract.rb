require_relative 'organism_classes'

# This abstract factory knoww what sorts of animals belong in the same ecosystem together
class PondOrganism
  def self.new_animal(name)
    Frog.new(name)
  end

  def self.new_plant(name)
    Algae.new(name)
  end
end

class JungleOrganism
  class << self
    def new_animal(name)
      Tiger.new(name)
    end

    def new_plant(name)
      Tree.new(name)
    end
  end
end


class Habitat
  def initialize(qty_animals:, qty_plants:, organism_factory_class: )
    @organism_factory = organism_factory_class

    @animals = []
    qty_animals.times do |i|
      animal = @organism_factory.new_animal("Animal#{i}")
      @animals << animal
    end

    @plants = []
    qty_plants.times do |i|
      plant = @organism_factory.new_plant("Plant#{i}")
      @plants << plant
    end
  end

  def simulate_life
    @animals.each do |animal|
      animal.eat
      animal.sleep
    end

    @plants.each(&:grow)
  end

end

puts 'Pond Life'
pond = Habitat.new(qty_animals: 3, qty_plants: 4, organism_factory_class: PondOrganism)
pond.simulate_life

puts ''
puts 'Jungle Life'
jungle = Habitat.new(qty_animals: 3, qty_plants: 4, organism_factory_class: JungleOrganism)
jungle.simulate_life
