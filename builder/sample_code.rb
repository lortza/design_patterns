# Very WIP


class DiningTable
  attr_accessor :table_top, :legs

  def initialize(table_top=TableTop.new, legs=Legs.new)
    @table_top = table_top
    @legs = legs
  end
end

class Legs
  def initialize(quantity=4, material='metal', style='hairpin')
    @quantity = quantity
    @material = material
    @style = style
  end
end

class TableTop
  def initialize(shape='circle', material='wood', radius=36)
    @shape = shape
    @material = material
    @radius = radius
  end
end


class DiningTableBuilder
  attr_reader :dining_table

  def initialize
    @dining_table = DiningTable.new
  end

  def leg_material(material)
    @dining_table.legs.material = material
  end

  def top_material(material)
    @dining_table.table_top.material = material
  end
end

builder = DiningTableBuilder.new
builder.top_material('glass')
# builder.leg_material('concrete')

table = builder.dining_table
puts table
