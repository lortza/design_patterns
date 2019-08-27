# Adapter Pattern
An object that crosses the chasm between the interface you have and the interface you need. You get encapsulation at the cost of complexity.

## Uses
When you have code that does a big chunk of labor (`LaborDoer`) for another class (`ThePerfectFit`) and then you have a _similar_ class (`SlightlyDifferent`) that you'd like to use that code for. Since ti doesn't quite fit as-is, you need to modify it a bit before you can run an instance of `SlightlyDifferent` through your `LaborDoer`.

## Pros
- You keep your code DRY by not recreating `LaborDoer`'s work over and over again.
- You keep a solid separation of concerns because your `SlightlyDifferent` shouldn't know about the `ThePerfectFit`'s interface.

## Cons
- it could seem a little clunky when you could simply put some of the adaptive methods inside the `SlightlyDifferent` class. Ex:
    ```
    def color
      @bto.colour
    end
    ```
- you could make a singleton version instead (pg 170)
