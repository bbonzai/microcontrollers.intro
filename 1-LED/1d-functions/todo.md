## To Do ##

1. Modify the `onTime()` function so that the parameter type of `onTime` is an `unsigned long` 
instead of `int`.  (Though the `delay` function can *accept* an `int`, it is actually
defined as a function that accepts an `unsigned long`.)  
The maximum value of an `int` is 32,767, whereas the maximum value of an 
`unsigned long` is 4,294,967,295.  Since `delay` interprets whatever number
is passed to it as time in *milliseconds*, the maximum delay that could be 
achieved by calling `delay` with an `int` variable is just over 32 sec, 
whereas the maximum delay that could be achieved by passing it an 
`unsigned long` value is almost 50 days!

2.  Modify the `loop` function so that it turns on the Red, Yellow, Green, and Yellow
lights in that order.  There is no need to modify the `onTime` function to achieve
this goal.

3.  Modify the `onTime` function so that it takes two "pin" parameters.
Then modify the statements in the `onTime` function so that it turns on two LEDs
at once, and then turns the two LEDs off at once.
In order to use your new function, you will also need to modify the statements
in the `loop` functio that invoke the `onTime` function.

4.  Modify the `init()` function so that just after it initializes each output pin,
it causes all 3 LEDs to turn on for a *very* brief period of time, e.g., 10 msec,
and then turn off.

5.  Modify `init()` again so that instead of incorporating the changes described
above, it calls another function to execute this high-speed blink.







