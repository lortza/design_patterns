
class Renderer
  def render(text_object)
    text = text_object.text
    size = text_object.size_inches
    color = text_object.color

    puts "I'm a #{size}-inch, #{color} text object that says: #{text}"
  end
end

# This renderer pairs nicely with this TextObject, since this is what it is expecting:
class TextObject
  attr_reader :text, :size_inches, :color

  def initialize(text, size_inches, color)
    @text = text
    @size_inches = size_inches
    @color = color
  end
end

# But it doesn't play nicely with this object:
class BritishTextObject
  attr_reader :body_copy, :size_mm, :colour

  def initialize(body_copy, size_mm, colour)
    @body_copy = body_copy
    @size_mm = size_mm
    @colour = colour
  end
  # ...
end

text_object = TextObject.new('holy moley!', 2, 'purple')
Renderer.new.render(text_object)
# Output:
# I'm a 2-inch, purple text object that says: holy moley!


# In order to make this _similar but different_ object work, we need to build an adapter
british_text_object = BritishTextObject.new('top o!', 44, 'teal')
Renderer.new.render(british_text_object) # as-is, fail whale!

class BritishTextObjectAdapter < TextObject
  def initialize(bto)
    @bto = bto
  end

  def text
    @bto.body_copy
  end

  def size_inches
    (@bto.size_mm / 25.4).round(2)
  end

  def color
    @bto.colour
  end
end

british_text_object = BritishTextObject.new('top o!', 44, 'teal')
adapted_object = BritishTextObjectAdapter.new(british_text_object)
Renderer.new.render(adapted_object) # yay! great success!
# Output:
# I'm a 1.73-inch, teal text object that says: top o!
