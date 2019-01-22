# Strategy Pattern
Page 77
"Pull the algorithm out into a separate object and use delegation"

## Uses
- When you want to customize part of an algorithm without using inheritance.

## Real Examples
- TBD

## Pros
- Is not as cumbersome as using class inheritance
- Provides tidy APIs for objects that talk to one another (good separation of concerns)
- All strategies can be used like interchangeable parts
- Switching strategies at run-time is super easy (`DisplayedCard.new` vs `DisplayedCard.new(ReversedCard.new)`)
- We limit our decision about which variation we're using to only a few places

## Cons
- It may be a little confusing to know the object relationships just by their names.
- It can be tricky to pass a bunch of data between the two classes without any guarantee that it will all be used.
- If you pass the main object as itself to the object being consumed `@format.read_card(self)`, you increase the coupling between the classes.
