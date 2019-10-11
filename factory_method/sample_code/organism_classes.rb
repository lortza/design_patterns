# Sample Organism classes that are used in teh example factories

class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts "#{self.class} #{@name} is eating plants and algae."
  end

  def sleep
    puts "#{self.class} #{@name} is sleeping under a bush."
  end
end

class Frog
  def initialize(name)
    @name = name
  end

  def eat
    puts "#{self.class} #{@name} is eating flies and worms."
  end

  def sleep
    puts "#{self.class} #{@name} is sleeping on a lilly pad."
  end
end

class Tiger
  def initialize(name)
    @name = name
  end

  def eat
    puts "#{self.class} #{@name} is eating all of the humans."
  end

  def sleep
    puts "#{self.class} #{@name} is sleeping in a Tree."
  end
end

class Tree
  def initialize(name)
    @name = name
  end

  def grow
    puts "#{self.class} #{@name} growing in the jungle."
  end
end

class WaterLily
  def initialize(name)
    @name = name
  end

  def grow
    puts "#{self.class} #{@name} floating on the pond."
  end
end

class Algae
  def initialize(name)
    @name = name
  end

  def grow
    puts "#{self.class} #{@name} growing on the rocks"
  end
end
