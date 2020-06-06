# Countdown problem

Programming in Haskell, p.111, Graham Hutton, 2nd Edition Cambridge

### Problem

Given a sequence of numbers and a target number, attempt to construct an expression 
whose value is the target, by combining one more numbers from the sequence using 
addition, subtraction, multiplication, division and parentheses.

[Entry point](./app/Countdown.hs) of the program, see also [additional main](./app/Main.hs) to try functions.

Please checkout [here](https://github.com/francesco-losciale/haskell-countdown/tags) all the tagged versions.
Below some descriptions

Version 1 - Implements brute force to generate all the possible expressions. The `valid` function is 
called only after the expression has been generated, when is being evaluated in the function `eval`.
