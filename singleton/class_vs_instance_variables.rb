class ClassVariableTester
  @@class_count = 0

  def initialize
    @instance_count = 0
  end

  def increment
    @@class_count += 1
    @instance_count += 1
  end

  def to_s
    "class_count: #{@@class_count} | instance_count: #{@instance_count}"
  end
end

c1 = ClassVariableTester.new
c1.increment
c1.increment
c1.increment

c2 = ClassVariableTester.new
c2.increment
c2.increment

puts c1 # class_count: 3 | instance_count: 3
puts c2 # class_count: 5 | instance_count: 2
