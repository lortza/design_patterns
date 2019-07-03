# Observer Pattern
Create an object that receives notifications when another object is updated. Keep these classes decoupled from each other so they can be easily maintained.

## Uses
When several other classes need to know about a given class, but you want to keep them independent. Ruby also has an `Observable` library in place, so we don't need to build our own. We can include it instead:
```ruby
require 'observer'

class Employee
  include Observable

  attr_reader :name, :salary
  ...

  def salary=(new_salary)
    @salary = new_salary
    changed
    notify_observers(self)
  end
```

## Pros
Keeps separation of concerns

## Cons
This one is named kind of strangely. The classes doing the observing are quite passive. Perhaps the name should go to the acting class in this relationship instead.
