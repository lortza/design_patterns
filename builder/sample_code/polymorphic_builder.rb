# Now we have differnt kinds of tables and will use some inheretance to build out base classes

# Start with our most base component classes
class Legs
  attr_accessor :quantity, :material, :style

  def initialize(quantity=4, material='metal', style='hairpin')
    @quantity = quantity
    @material = material
    @style = style
  end
end

class Top
  attr_accessor :shape, :material, :radius

  def initialize(shape='circle', material='wood', radius=36)
    @shape = shape
    @material = material
    @radius = radius
  end
end

# And now our specific types of tables
class DiningTable
  attr_accessor :top, :legs

  def initialize(top=Top.new, legs=Legs.new)
    @top = top
    @legs = legs
  end
end

class BedsideTable
  attr_accessor :top, :legs, :drawers

  def initialize(top=Top.new, legs=Legs.new, drawers=1)
    @top = top
    @legs = legs
    @drawers = drawers
  end
end



# This generic table builder has all of the stuff any basic table would have
class TableBuilder
  attr_reader :table

  def leg_material=(material)
    @table.legs.material = material
  end

  def top_material=(material)
    @table.top.material = material
  end

  def add_finish_color(color)
    @table.top.finish_color = color
    @table.legs.finish_color = color
  end
end


# This Bedside table builder class is customized to bedside tables
class BedsideTableBuilder < TableBuilder
  attr_reader :bedside_table

  def initialize
    @bedside_table = DiningTable.new
  end
end

# This Dining table builder class is customized to dining tables
class DiningTableBuilder < TableBuilder
  attr_reader :dining_table

  def initialize
    @dining_table = DiningTable.new
  end
end

builder = DiningTableBuilder.new
builder.top_material('glass')
builder.leg_material('concrete')

table = builder.dining_table
puts table.top.material
