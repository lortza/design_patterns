# Composite Pattern
Builds objects out of other smaller objects. Ex:
```
                     manufacture_cake
                   ___________|____________
                   |                      |
               make_cake            package_cake
     _______________|___________       ___|___
     |            |      |     |       |     |
make_batter  fill_pan  bake  frost    box  label
```

## Uses
Useful when you need to build a cascading series of smaller things all at once.

## Pros
Does a really good job of separating concerns into their own components. Makes clear relationships between components.

## Cons
Confuses me at the moment by making classes for verbs where previously I associate classes with nouns.
