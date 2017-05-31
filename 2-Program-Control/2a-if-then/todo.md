%
% Susan G. Kleinmann
% Jul 4, 2016

1. Try the sample code with the circuit using an external LEDs rather than the
on-board LED.  

2. Try the sample code with two external LEDs rather than 1.  Let's say 
you use the red LED and the green LED.  Then modify the
`if...else` statement so that when the red LED is turned on, the green LED
is turned off, and when the green LED is turned on, the red LED is turned off.

3. Modify the delay time every 5th time the Arduino goes through `loop()`.
To do this, 

> * declare a global `int` variable called `counter` and initialize it to 0
> * declare another global `int` variable called `delayTime` and initialize it to (say) 200.

> > Now modify `loop()` to include another `if...else` statement 
at the top.  This statement should test the value of `counter`:

> * If `counter` < 5, then the increment `counter` by 1
> * If `counter` >= 5, then reset `counter` to 0, and increment `delayTime` by 100. 

