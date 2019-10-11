require_relative 'organism_classes'

class OrganismFactory
  def initialize(plant_class:, animal_class:)
    @plant_class = plant_class
    @animal_class = animal_class
  end

  def new_animal(name)
    @animal_class.new(name)
  end

  def new_plant(name)
    @plant_class.new(name)
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
pond_organism_factory = OrganismFactory.new(plant_class: Algae, animal_class: Duck)
pond = Habitat.new(qty_animals: 3, qty_plants: 4, organism_factory_class: pond_organism_factory)
pond.simulate_life

puts ''
puts 'Jungle Life'
jungle_organism_factory = OrganismFactory.new(plant_class: Tree, animal_class: Tiger)
jungle = Habitat.new(qty_animals: 3, qty_plants: 4, organism_factory_class: jungle_organism_factory)
jungle.simulate_life
