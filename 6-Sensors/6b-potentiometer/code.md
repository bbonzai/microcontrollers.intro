%
% Susan G. Kleinmann
% June 22, 2016

This sketch reads the current voltage on a pot, and sets the angle of a servo
in response.  So:

| Pot Setting             | Pot Voltage                    | Servo Setting                   |
|:-----------------------:|:------------------------------:|:--------------------------------|
| Minimum value           | 0V                             | 0°                              |
| (an Intermediate value) | (some voltage between 0 and 5) | (some angle between 0° and 180° |
| Maximum value           | 5V                             | 180°                            |

## Using the Pot ##

To read the voltage from the pot, use the Arduino function `analogRead()`.  This function
takes one parameter, which is the pin number to read.  

Input to `analogRead()`
: any digit from 0 through 5 (for ports A0 through A5 on the UNO)

Output from `analogRead()`
: an integer from 0 to 1023

To set the servo angle to something in the range 0° to 180°, the range of values
produced by `analogRead()` must be converted into a range of values suitable for 
the Servo `.write()` method, i.e. 0 through 180.  To do this, use the Arduino `map()`
function, which maps an input value (`val`) in the range (`inputmin`...`inputmax`) 
to the range (`outputmin`...`outputmax`).  

Example: 
: Suppose the voltage on the pot signal pin is 2.5V. 
: This is read by the microcontroller's analog-to-digital converter as the value 512.
: To convert this number into an angle in the range 0 through 180 required
: by the servo, use:
:
: >     angle = map(512,0,1023,0,180) 

The final sketch to control the servo position using the pot is:

    #include <Servo.h>
    
    int servoPin=9;             // This is digital pin 9, aka "9"
    int potPin=4;               // This is analog pin 4, aka "A4"

    Servo servo;
    
    void setup(){  
      servo.write(90);          // Set default servo angle to the middle of its range
      servo.attach(servoPin);   // Power up the servo
      delay(100);               // Give the servo time to get there
    }
    
    void loop(){
      int potSetting=analogRead(potPin);
      int angle=map(potSetting,0,1023,0,179);
      servo.write(angle);
      delay(200);
    }
