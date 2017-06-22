1. Add a delay between each *character* (just so that it's easy to disntinguish
one character from the next when you look at the LED).  This delay should 
be shorter than the "inter-word" delay at the end of `loop()`.

2. Surround all the statements within `loop()` with a `for` loop that 
produces 5 "SOS" messages, and then executes a long-ish "inter-message"
delay (say, 5 seconds).

3. Modify the first `for` loop so that it produces 3 short blinks, modify the
second `for` loop so that it produces 3 medium-length blinks, and modify the third 
`for` loop so that it produces 3 long blinks.  (This doesn't have any particular
meaning in Morse code, it's just an exercise in using `for` loops.)

4.  Replace the `for` loops in the sample sketch with a set of 4 `for` loops
which produce the light pattern for the digits 0 through 3:

> * To make a `0`, insert a `for` loop that makes 5 long blinks.
> * To make a `1`, make 1 short blink, followed by a `for` loop that makes 4 long blinks.
> * To make a `2`, make 2 short blinks, followed by a `for` loop that makes 3 long blinks.
> * To make a `3`, make 3 short blinks, followed by a `for` loop that makes 2 long blinks.

> > (For a much easier way to implement digits in Morse code, see the packet 
> > on writing [functions](../1d-functions)).

5. Use the LED to spell out "help" instead of "SOS".  Some of the letters
in "help" are well suited to using `for` loops, and others are not.

> * The letter "h" will use 4 short blinks.
> * The letter "e" uses only 1 blink.
> * The letter "l" uses 1 short blink, 1 long blink, and 2 short blinks.
> * The letter "p" uses 1 short blink, 2 long blinks, and 1 short blink.

6. Try implementing any of the "TODO's" above as `while` loops instead.

7. Set up a global variable `delayTime` and initialize it with a value of 1000.  
Then, in `loop()`, implement a `while` loop that:

> * tests whether that `delayTime` is greater than 20ms, then
> * blinks an LED with that delay time, and then
> * shortens that delay time by 10%:

> >     delayTime = delayTime * 0.9;

> > After the `while` loop, reset `delayTime` back to 1000 msec.


