require_relative 'organism_classes'

class Pond
  def initialize(number_animals, animal_class, number_plants, plant_class )
    @animal_class = animal_class
    @plant_class = plant_class

    @animals = []
    number_animals.times do |i|
      animal = new_organism(:animal, "#{animal_class}#{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = new_organism(:plant, "#{plant_class}#{i}")
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

  private

  def new_organism(type, name)
    case type
    when :animal
      @animal_class.new(name)
    when :plant
      @plant_class.new(name)
    else
      raise "Unknonw organism type: #{type}"
    end
  end
end

puts 'Pond Life'
pond = Pond.new(3, Duck, 4, WaterLily)
pond.simulate_life
