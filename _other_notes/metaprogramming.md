# Metaprogramming Pattern

## Uses
Used to reuse the same snippet of code over and over on different classes.

### Example
I used it in Danebook (Facebook project) to manage similar but different user activities: `Post`s, `Photo`s, `Comment`s

### Handy Methods

```ruby
"a".instance_of? String # => true
"a".is_a? String # => true
"a".kind_of? String # => true
```
`class_eval` allows us to define a method within a class while outside of its original definition and without reopening the class with the standard syntax. This could be useful when the class you want to add this method to is not known until runtime.

```ruby
# the class we want to edit has no `self.say_hello` class method
class Person
end

# we make the class respond to this method now
Person.class_eval do
  def say_hello
   "Hello!"
  end
end

person = Person.new
person.say_hello # "Hello!"
```
[see this post](https://www.jimmycuadra.com/posts/metaprogramming-ruby-class-eval-and-instance-eval/)

`instance_eval` does the same thing but for instance methods
```ruby
# the class we want to edit has no `human?` instance method
class Person
end

# we make the instance of this class respond to this method now
Person.instance_eval do
  def human?
    true
  end
end

Person.human? # true
```
[see this post](https://www.jimmycuadra.com/posts/metaprogramming-ruby-class-eval-and-instance-eval/)

## Pros
* Gives you the flexibility to call classes at runtime
* removes a bunch of conditions and decisions from the codebase `if object.is_a(ClassName) do x...`

## Cons
* hard to debug because method names are not searchable in the codebase
* flexible to a point, but then you're kind of locked into a complicated pattern
* can be jumped to a little too quickly, making your code prematurely complicated
