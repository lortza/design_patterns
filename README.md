# Design Patterns (in Ruby)

This repo is a sandbox tool for me as I work my way through learning the design patterns in Ruby as described by Russ Olsen in his book _[Design Patterns in Ruby](https://www.goodreads.com/book/show/2278064.Design_Patterns_in_Ruby)_.

## Others' Repos
- https://github.com/nslocum/design-patterns-in-ruby
- https://github.com/davidgf/design-patterns-in-ruby

## Patterns
- [Adapter](/Adapter): An object that spans the gap between the interface you have and the interface you need. You get encapsulation at the cost of complexity.
- [Builder](/builder): Encapsulates construction logic into a class of its own.
- [Command](/command): separate the action bits into their own object that's separate from the static bits.
- [Composite](/composite): build bigger objects out of smaller objects and allow methods to cascade. Uses 1 level of inheritance.
- [Decorator](/decorator): make similar customizations to an object in an a la carte fashion at runtime.
- [Domain-Specific Languages (DSL)](/dsl): suggests that you should focus on the language itself, making problems easier to solve by giving the user a convenient syntax for expressing the problem. Builds on the ideas in the [Interpreter Pattern](/interpreter).
- [Factory Method](/factory_method): Solving the problem of picking the right class for the circumstances.
- [Interpreter](/interpreter): Good for interfacing between discreet chunks of code that otherwise have trouble talking to each other
- [Iterator](/iterator): iterate over objects inside of a black box
- [Observer](/observer): automatically notify observing objects when an object changes.
- Proxy
- [Proxy](/proxy): Controlling access to an object or providing location-independent access to an object.
- [Template Method](/template_method): allows you to customize the steps of a process without changing the process. Uses inheritance.
- [Singleton](/singleton): wip
- [Strategy](/strategy): pull the algorithm out into a separate object.

## Other Notes
- [Meta-programming](/_other_notes/metaprogramming.md): WIP
- [Convention over Configuration](_other_notes/convention.md): WIP
