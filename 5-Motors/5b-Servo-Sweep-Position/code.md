## Code to Continuously Sweep a Servo in Small Steps ## 

Both examples below use a `for` loop to sweep the servo smoothly from its starting
position to its ending position.

### Sweep the Servo in Units of Degrees ###

This sketch uses `Servo.write()` to move a servo from 0° to 180° in units of 1°: 

    #include <Servo.h>
    
    int servoPin=9;
    Servo s;
    
    void setup(){  
        s.write(0);           // Set 0° to be the initial position
        s.attach(servoPin);   // Power up the servo
    }
    
    void loop(){
        for (int i=0; i<180; i++) {
            s.write(i);       // Move to 0°
            delay(10);        // Wait for the servo to get there
        }
        delay(250);           // Pause to appreciate the nice smooth sweep just accomplished!
        s.write(0);           // Move back to the starting position
        delay(2000);          // Wait for the servo to get there
    }

### Sweep the Servo in Units of microSeconds ###

This sketch uses `Servo.write()`, to drive a servo by specifying pulse
width rather than target angle.  The range of pulse widths in the sketch
is 1000 microSeconds to 2000 microseconds.  For many servos, this range
of pulse widths corresponds to positions from 0° to 180°.

    #include <Servo.h>
    
    int servoPin=9;
    Servo s;
    
    void setup(){  
        s.write(0);           // Set 0° to be the initial position
        s.attach(servoPin);   // Power up the servo
    }
    
    void loop(){
        for (int i=1000; i<2000; i++) {
            s.write(i);       // Move to 0°
            delay(5);         // Wait just a short time to move such a small distance
        }
        delay(250);           // Pause to appreciate the nice smooth sweep just accomplished!
        s.write(0);           // Move back to the center position
        delay(2000);          // Wait for the servo to get there
    }
