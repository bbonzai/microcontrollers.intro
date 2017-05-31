%
% Susan G. Kleinmann
% June 19, 2016

1. Try implementing any of the "TODO's" in the [packet on for loops](../2b-for-loops) 
as `while` loops instead.

2. Set up a global variable `delayTime` and initialize it with a value of 1000.  
Then, in `loop()`, implement a `while` loop that:

> * tests whether that `delayTime` is greater than 20ms, then
> * blinks an LED with that delay time, and then
> * shortens that delay time by 10%:

> >     delayTime = delayTime * 0.9;

> > After the `while` loop, reset `delayTime` back to 1000 msec.


