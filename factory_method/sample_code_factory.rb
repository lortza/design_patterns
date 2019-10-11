class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts "#{@name} is eating plants and algae."
  end

  def sleep
    puts "#{@name} is sleeping under a bush."
  end
end

class Frog
  def initialize(name)
    @name = name
  end

  def eat
    puts "#{@name} is eating flies and worms."
  end

  def sleep
    puts "#{@name} is sleeping on a lilly pad."
  end
end

class WaterLily
  def initialize(name)
    @name = name
  end

  def grow
    puts "#{@name} floating on the pond."
  end
end

class Algae
  def initialize(name)
    @name = name
  end

  def grow
    puts "#{@name} growing on the rocks"
  end
end


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

pond = Pond.new(3, Duck, 4, WaterLily)
pond.simulate_life
