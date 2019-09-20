# Decorator Pattern

## Uses
Making similar customizations to an object in an a la carte fashion at runtime.

## Pros
Having individual decorators offers a nice separation of concerns. If we ever need to add or drop one, it seems to be pretty painless. repetitive nature of all of the inherited decorators makes maintaining decorator `X` easy to understand if you've seen decorator `Y` before.

## Cons
There is one level of inheritance between the decorator base class and the individual decorators, so that may become cumbersome for maintenance. Another potential downfall is that a person may not go looking for existing decorators before building out a redundant one.  
