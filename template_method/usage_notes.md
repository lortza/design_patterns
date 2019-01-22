# Template Method Pattern
Page 59

## Uses
- When you have a basic outline of the thing you want to accomplish, but the implementation of each step my require customization.
- When customization needs can be corralled easily into specific subclasses.

## Real Examples
The `GenericServer` class in the Ruby WEBrick library.

## Pros
- It's a pretty simple concept to use parent and subclasses.
- Inheriting the main `build` method makes easy logical sense for people who don't know many design patterns but understand basic inheritance.
- Hook methods make the main `build` method run seamlessly.

## Cons
- It can be easy to get carried away with inheritance.
- Maintaining consistency with the customized methods across a lot of subclasses may be challenging.
- Since this is based on inheritance, any changes made to the parent class may have unexpected or unintended consequences for the subclasses.
