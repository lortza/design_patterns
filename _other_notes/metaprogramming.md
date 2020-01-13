# Metaprogramming Pattern

## Uses
Used to reuse the same snippet of code over and over on different classes.

### Example
I used it in Danebook (Facebook project) to manage similar but different user activities: `Post`s, `Photo`s, `Comment`s

## Pros
* Gives you the flexibility to call classes at runtime
* removes a bunch of conditions and decisions from the codebase `if object.is_a(ClassName) do x...`

## Cons
* hard to debug because method names are not searchable in the codebase
* flexible to a point, but then you're kind of locked into a complicated pattern
* can be jumped to a little too quickly, making your code prematurely complicated
