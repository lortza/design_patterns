# DSL Pattern: Internal DSL
Suggests that you should focus on the language itself, making problems easier to solve by giving the user a convenient syntax for expressing the problem.

## Uses
* An Internal DSL: we start with an implementation language (like Ruby) and bend it into being our DSL.
* An External DSL: There would be parser program and an interpreter program that are separate from each other.

### Example
File backup system takes in a directory, a backup destination, and an interval. A real world example is Ruby's `rake` DSL.

## Pros
This is a super flexible way to write out very separate concerns for things you'd like to accomplish. Each codebase could be living on another planet, logicwise.

## Cons
Error messages shown to end users come from straight ruby. This can be challenging for folks who don't speak ruby.
