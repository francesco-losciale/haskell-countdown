# Countdown problem

Programming in Haskell, p.111, Graham Hutton, 2nd Edition Cambridge

### Problem

Given a sequence of numbers and a target number, attempt to construct an expression 
whose value is the target, by combining one more numbers from the sequence using 
addition, subtraction, multiplication, division and parentheses.

[Entry point](./app/Countdown.hs) of the program, see also [additional main](./app/Main.hs) to try functions.

Please checkout [here](https://github.com/francesco-losciale/haskell-countdown/tags) all the tagged versions.
Below some descriptions

### Tag countdown-version-1
Implements brute force to generate all the possible expressions. The `valid` function to check
 that the operator can be applied to the numbers is called only after the expression has been generated, 
 inside the function `eval`.

### Tag countdown-version-2 
Same solution as before, with improved performance. The `eval` function is not used anymore. 
The `combine'` function now is constructing the expression only if the operator is valid on x and y.
While in version-1 we first constructed all the expression, and then we checked in `eval` whether
they had a valid operator or not. 

Version-2 constructs way less expressions, since the validation at an earlier stage. All the expressions 
that would have failed the validation are not constructed.