%
% Susan G. Kleinmann
% July 4, 2017

The packets in this group introduce a number of general programming 
constructs that will be useful in all further examples.

All of them can be demonstrated using an on-board or external LED.
The "circuit" (just the Arduino board attached to a power source)
for all the packets in this group is the same as that for
the initial packet on [blinking the on-board LED](../1-LED/1a-OnBoardLED/circuit.html).

## `if`...`then` -- Conditional Execution ##

An `if` statement tests whether some condition is `true`, and if so, 
executes a command or a block of commands.
This is the most basic and essential technique in using microcontrollers.

`if...then` statements are covered in [packet 2a](2a-if-then).

## `for` loops -- Repeating Things a Definite Number of Times ##

A `for` loop (not to be confused with the Arduino `loop` function in
your sketch!) provides a counting mechanism ("Do these statements
this many times), greatly shortening your program.  

Instructions to write a `for` loop are given in [packet 2b](2b-for-loops).

## `while loops` -- Repeating Things until some condition is met ##

Closely related to `for` loops are `while` loops, which repeat a
squence of statements until some condition is met.  
All `for` loops can be written as equivalent `while` loops and
vice versa.  However, some programs just *read* more naturally
when written using one or the other.

`while` loops are covered in [packet 2c](2c-while-loops).

## Using functions ##

<!--
Functions help you build complex programs with minimal 
number of statements.  Reducing the size of a program improves
its readability, its maintainability, and is likely to reduce
errors, especially when it is important to make small adjustments.
-->

Like `for` loops and `while` loops, functions allow you to define
a block of statements that can be easily repeated.  Functions
have two key advantages over loops:

* Functions have names, which means they can be "called" at any 
point in your program.  
* Functions take "parameters", so that their outcome can be adjusted for
different inputs.

`functions` are covered in [packet 2d](2d-functions).

