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

class Pond
  def initialize(args)
    @args = args
    @animals = build_animals
  end

  def simulate_life
    @animals.each do |animal|
      animal.eat
      animal.sleep
    end
  end

  private
  def build_animals
    critters = []
    @args.each do |pair|
      pair[:qty].times do |i|
        critter = pair[:klass].new("#{pair[:klass]}#{i}")
        critters << critter
      end
    end
    critters
  end
end



pond = Pond.new([{qty: 2, klass: Duck}, {qty: 3, klass: Frog}])

pond.simulate_life

# Duck0 is eating plants and algae.
# Duck0 is sleeping under a bush.
# Duck1 is eating plants and algae.
# Duck1 is sleeping under a bush.
# Frog0 is eating flies and worms.
# Frog0 is sleeping on a lilly pad.
# Frog1 is eating flies and worms.
# Frog1 is sleeping on a lilly pad.
# Frog2 is eating flies and worms.
# Frog2 is sleeping on a lilly pad.
