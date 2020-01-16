# Convention over Configuration

## Uses
Brought to us by the Rails framework, this approach allows users (engineers) to step into a codebase and get up to speed quickly.

### Example
* `UsersController`: Instead of asking people to add a bunch of hardcoding and config every time they want to add a new kind of a class, establish a convention for people to follow and have the system automatically add those things. The convention is `[your new class]sController` and `[your new class]sHelper`. This are then saved in the appropriate folder and the system knows where to look for them.

## Pros
* reduces the unknown and allows engineers to step into codebases more easily because things are in expected places or follow expected patterns

## Cons

## Notes
A good user interface...
* anticipates the user's need by making common tasks easy to accomplish. It may even make the most common scenario happen by default. Don't give equal weight to all interactions.
* allows the user to be DRY. Consider grouping like files into a folder, so users don't have to name each file with that commonality in mind.
* provides a starter template for the basic, repeatable, known things
