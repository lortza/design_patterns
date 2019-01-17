class Dwelling

  def build
    give_intro
    locate_building_site
    set_foundation
    set_walls
    add_roof
    install_windows
    finish_interior
    arrange_belongings
  end

  def give_intro
    # This is a defualt method. It sets a default, but
    # the default can be overwritten by a subclass.
    intro = "Instructions for Building a #{self.class.name}:"
    puts "-" * intro.length
    puts intro
    puts "-" * intro.length
  end

  def locate_building_site
    puts "Find a level surface large enough for your #{self.class.name.downcase}'s foundation and clear the area."
  end

  def set_foundation
    # This is a "hook" method.
    # It's empty, but its being called in the main build method.
    # This way, a subclass can customize it and it's already being called,
    # but it doesn't need to have a default set.
  end

  def set_walls
  end

  def add_roof
  end

  def install_windows
  end

  def finish_interior
  end

  def arrange_belongings
    puts "Move your belongings in and arrange them as you see fit."
  end
end


class Tent < Dwelling
  def set_foundation
    puts "Spread out evenly on your site and stake the corners."
  end

  def set_walls
    puts "Clip rods to hooks of matching color. "
  end

  def install_windows
    puts "Unzip doors and windows. Roll and secure the flaps."
  end
end

class StrawHouse < Dwelling
  def set_foundation
    "Clear a flat area and stack hay bales in a square shape."
  end

  def set_walls
    puts "Keep stacking hay bales neatly, overlapping like bricks."
  end
end


Dwelling.new.build
# -------------------------------------
# Instructions for Building a Dwelling:
# -------------------------------------
# Find a level surface large enough for your dwelling's foun
# dation and clear the area.
# Move your belongings in and arrange them as you see fit.


Tent.new.build
# ---------------------------------
# Instructions for Building a Tent:
# ---------------------------------
# Find a level surface large enough for your tent's foundati
# on and clear the area.
# Spread out evenly on your site and stake the corners.
# Clip rods to hooks of matching color.
# Unzip doors and windows. Roll and secure the flaps.
# Move your belongings in and arrange them as you see fit.


StrawHouse.new.build
# ---------------------------------------
# Instructions for Building a StrawHouse:
# ---------------------------------------
# Find a level surface large enough for your strawhouse's fo
# undation and clear the area.
# Keep stacking hay bales neatly, overlapping like bricks.
# Move your belongings in and arrange them as you see fit.
