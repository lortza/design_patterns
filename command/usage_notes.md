# Command Pattern
Separate command/action logic out into its own object from surrounding logic to reduce redundancy or inheritance

## Uses
Ex: you have a lot of buttons on your website. Instead of inheriting like `SaveButton < Button`, you pass the concept of `save` into the instance of `Button`. The instance then executes its `@command` and the `save` action happens.

## Pros
Nice separation of concerns. It separates the thing that changes from the static thing. You can also build these in conjunction with the [Composite](/composite) pattern. Another pro is that you can queue a bunch of these kinds of actions up and run them all at once on your db instead of holding the connection open while a user decides their next steps. 

## Cons
The static thing has to know enough about the dynamic thing to be able to invoke the action. For example, the instance of button needs to know how to call the save action:
```ruby
class Button
  def initialize(command)
    @command = command
  end

  def on_button_push
    @command&.execute  # <-- the Button has to know to call `execute`
  end
end

static_button = Button.new(SaveCommand.new)
```

This can be resolved by using a block instead:
```ruby
class ButtonWithBlock
  def initialize(&block)
    @command = block
  end

  def on_button_push
    @command&.call
  end
end

save_button_with_block = ButtonWithBlock.new do
  puts "holla! i'm up in your button saving your stuff via a block!"
end

save_button_with_block.on_button_push
```
