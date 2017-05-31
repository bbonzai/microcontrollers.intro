%
% Susan G. Kleinmann
% June 29, 2016

1.  Add some bells and whistles to the `loop()` function.  For example,
have it calculate the difference between the current position angle of the
servo and the target position angle.

2.  Show the user how much time it took to get from the current position angle
of the servo to the target position.  To do that, use the Arduino function
`millis()` which reports the number of milliseconds since the board was last
reset; `millis()` takes no arguments; it returns a long value.  So, just 
before setting the servo to a new position, execute a command like this:

    long t0 = millis();

> Then move the servo, and execute another invocation of `millis()`:

> >    long t1 = millis();

> Then report the difference between the two to the Serial Console.

> >    Serial.println(t1-t0);

3.  Improve on the last exercise, by getting the sketch to compute the
average sweep speed, i.e., 

    int speed = ((final angle) - (initial angle) )/(t1-t0).



    
