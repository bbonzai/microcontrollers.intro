## Circuit to Control a Hobby-Type Servo Motor ##

To control the servo, you'll need special functions that will 
create pulses of `HIGH/LOW` signals on the I/O pin attached to the
servo's control line. 

Good news!  These functions are already available with your Arduino software, 
in a in a "library" called "Servo" library.  To include that library with your 
sketch, you can either:

* use the Library menu:

> >   Click Sketch → Include Library → Servo

* just type the following line at the top of your sketch:

> >    `#include <Servo.h>`

The Servo library defines a new (complex) datatype (called a `Servo`), and a 
set of functions that can get or set the values of that datatype, and 
thereby control your servomotor.  

> Note:  This special complex data type (which is built from ordinary datatypes) like `int`
> and `float`) is called an `object`.  

> > To learn more about complex data types
> > in general, see [this](/Glossary/complex_datatype.html).

> > To learn more about object, see [this](/Glossary/objects.html).

### Set the Servo to A Fixed Position ### 

The following sketch moves the servo to a position of 0° and leaves it
there.  Since there is no followup action that will be repeated,
all of this can be accomplished within the `setup()` function, and
the `loop()` function can be empty.

    #include <Servo.h>
    
    int servoPin=9;
    Servo s;
    
    void setup(){  
        s.write(90);         // Set 90° to be the initial position
        s.attach(servoPin);   // Power up the servo
    }
    
    void loop(){
    }


### (Repeatedly) Set the Servo to 3 Discrete Positions ### 

This sketch starts the servo out at 0°, and then, on every loop moves the servo
from this position to the midpoint of its range, and finally to its far position,
180°.

    #include <Servo.h>
    
    int servoPin=9;
    Servo s;
    
    void setup(){  
        s.write(0);           // Set 0° to be the default position when servo is powered up
        s.attach(servoPin);   // Power up the servo 
        delay(100);           // Wait 100ms for the servo to get there
    }
    
    /* Use the loop function just to move the servo from its extreme left
      position to its mid-point, and then to its extreme right position.
    */
    void loop(){
        s.write(0);           // Move to 0°
        delay(1000);          // Wait for the servo to get there
        s.write(90);          // Move to 90°
        delay(1000);          // Wait for the servo to get there
        s.write(180);         // Move to 180°
        delay(1000);          // Wait for the servo to get there
    }


### (Repeatedly) Set the Servo to 3 Discrete Positions and Then Power Down the Servo ### 

This sketch is the same as the one above, except that it actually powers down the servo 
near the end of the loop.  (On a robot, this technique might be used to save power, for 
example.)  Then the sketch calls the `setup()` function again (!) to reset the starting 
position to 0° and power up the servo.

    #include <Servo.h>
    
    int servoPin=9;
    Servo s;
    
    void setup(){  
        s.write(0);           // Set 0° to be the default position when servo is powered up
        s.attach(servoPin);   // Power up the servo 
        delay(100);           // Wait 100ms for the servo to get there
    }
    
    void loop(){
        s.write(0);           // Move to 0°
        delay(1000);          // Wait for the servo to get there
        s.write(90);          // Move to 90°
        delay(1000);          // Wait for the servo to get there
        s.write(180);         // Move to 180°
        delay(1000);          // Wait for the servo to get there
        s.detach();
        delay(4000);
        setup();
    }

