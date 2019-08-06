class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end


instruments = %w[tuba flute oboe bassoon]
ai = ArrayIterator.new(instruments)
while ai.has_next?
  puts "item: #{ai.next_item}"
end

# Output
# item: tuba
# item: flute
# item: oboe
# item: bassoon

#--------------------------------

# This method is not working like it is supposed to... :shrug:
def merge(array1, array2)
  merged = []

  iterator1 = ArrayIterator.new(array1)
  iterator2 = ArrayIterator.new(array2)

  while iterator1.has_next? && iterator2.has_next?
    # Push the smallest value into "merged"
    puts "Iterator1: #{iterator1.item} | Iterator2: #{iterator2.item}"
    if iterator1.item < iterator2.item
      merged << iterator1.next_item
      puts merged
    else
      merged << iterator2.next_item
    end
    puts iterator2.next_item

    # Pick up array1 leftovers
    while iterator1.has_next?
      merged << iterator1.next_item
    end

    # Pick up array2 leftovers
    while iterator2.has_next?
      merged << iterator2.next_item
    end

    merged
  end
end

foods1 = ['apple', 'raisin', 'cupcake']
foods2 = ['banana', 'watermelon', 'lentil']

p merge(foods1, foods2)


#--------------------------------

# Problem: the index gets messed up you delete mid-iteration
colors = %w[red green blue purple]

# This is cool
colors.each do |color|
  # puts color
end

# Output:
# red
# green
# blue
# purple


# This is not cool
colors.each do |color|
  puts color
  colors.delete(color) if color == 'green'
end

# Output:
# red
# green   <= whhhaaattt? where did blue go?
# purple
