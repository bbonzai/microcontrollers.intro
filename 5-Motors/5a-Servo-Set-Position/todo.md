## To Do ##

1.  Revise the example code so that the servo moves through the discrete positions:
0°, 10°, 20°, etc.  

2.  Revise the example code to experiment with the delay time and see how short 
you can make it before the servo starts mis-behaving.

3.  Revise the example code so that the on-board LED blinks for a short time 
   (say, 20 msec) when the servo reaches its extreme clockwise position.

4.  Modify the `loop()` function so that it calculates the difference between 
the current position angle of the servo and the target position angle.
Display that difference in the Serial Console.

5.  Show the user how much time it took to get from the current position angle
of the servo to the target position.  To do that, use the Arduino function
`millis()` which reports the number of milliseconds since the board was last
reset; `millis()` takes no arguments; it returns a long value.  So, just 
before setting the servo to a new position, execute a command like this:

> >    long t0 = millis();

> Then move the servo, and execute another invocation of `millis()`:

> >    long t1 = millis();

> Then report the difference between the two to the Serial Console.

> >    Serial.println(t1-t0);

6.  Improve on the last exercise, by getting the sketch to compute the
average sweep speed, i.e., 

> >    int speed = ((final angle) - (initial angle) )/(t1-t0).



    



