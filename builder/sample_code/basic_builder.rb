# We want to build a dining table
class DiningTable
  attr_accessor :top, :legs

  def initialize(top=Top.new, legs=Legs.new)
    @top = top
    @legs = legs
  end
end

# The dining table has these component classes
class Legs
  attr_accessor :quantity, :material, :style, :finish_color

  def initialize(quantity=4, material='metal', style='hairpin')
    @quantity = quantity
    @material = material
    @style = style
    @finish_color = 'natural'
  end
end

class Top
  attr_accessor :shape, :material, :radius, :finish_color

  def initialize(shape='circle', material='wood', radius=36)
    @shape = shape
    @material = material
    @radius = radius
    @finish_color = 'natural'
  end
end

# The builder knows how to build a table and lets you interact
class DiningTableBuilder
  attr_reader :dining_table

  def initialize
    @dining_table = DiningTable.new
  end

  def leg_material=(material)
    @dining_table.legs.material = material
  end

  def top_material=(material)
    @dining_table.top.material = material
  end

  def add_finish_color(color)
    @dining_table.top.finish_color = color
    @dining_table.legs.finish_color = color
  end
end

# Build a basic dining table with all of the defaults
builder = DiningTableBuilder.new
table = builder.dining_table  # Woohoo! Done!
puts 'Default table'
puts table.top.material       # prints 'wood'
puts table.top.finish_color   # prints 'natural'
puts table.legs.finish_color  # prints 'natural'

# Add a bunch of customizations to the table with the builder if you want to
builder.top_material=('glass')
builder.leg_material=('concrete')
builder.add_finish_color('cherry red')

puts 'Customized table'
puts table.top.material       # prints 'glass'
puts table.legs.material      # prints 'concrets'
puts table.top.finish_color   # prints 'cherry red'
puts table.legs.finish_color  # prints 'cherry red'
