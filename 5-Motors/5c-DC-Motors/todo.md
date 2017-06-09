## To Do ##

1.  Try slightly lower values for the slowest speed and see just how low it 
can go before the motor refuses to move at all.

2.  Add Serial console output.  That is, add a line to the `setup()` function 
that initializes the serial console:

> >     Serial.initialize(115200);

> Then in the `loop()` function, write the current voltage setting to the 
> console before each speed change, e.g.:

> >     Serial.println(50);

3.  Get Serial console input.  In the `loop()` function, fetch input:

> >     while !(Serial.available());  // Do nothing while no input is available
> >     int inputVal = Serial.parseInt();
> >     int motorVal = map(inputVal, 0, 1023, 0, 255);
> >     analogWrite(motorPin, motorVal);
