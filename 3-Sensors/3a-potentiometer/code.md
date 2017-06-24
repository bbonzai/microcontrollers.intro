## Code to Using a Potentiometer ##

### Read the Pot Voltage ###

This sketch reads the voltage on a pot, using the arduino function `analogRead()`.
It then writes that function to the Serial Console, waits 1 second, and then
reads the pot again.

Reading the pot voltage is done using the arduino function `analogRead()`.
This function takes one parameter: the pin number to read.  
If the pot is wired up as shown in the [circuit](circuit.html#noled), then
the pin number being read is Analog I/O pin 0 (where the center pin of the 
pot is attached).  As always, it is good practice *not* to use the I/O pin
number in your invocation of `analogRead()`, but instead to use a name
that was attached to the I/O pin number in the header (outside of, and before,
the `setup()` or `loop()` functions:

    int POT = 0;             // Place this before setup() or loop()

Then the voltage on that pin can be read at any time using: 

    analogRead(POTPIN);      // Use this in the loop() function

It is probably useful to store that reading in a variable, which can be
an ordinary `int`:

    int vInput = analogRead(POTPIN);

The output from `analogRead()` will be some value between 0 and 1023.

A sketch which just displays the value read from the pot once a second
is shown below:

    int POTPIN = 0;               // This is analog pin 0, aka "A0"
    
    void setup(){  
        pinMode(POT, INPUT);
        Serial.begin(57600);
    }
    
    void loop(){
      int vInput = analogRead(POTPIN);
      Serial.println(vInput);
      delay(1000);
    }

### Control the Brightness of an LED with the POT ###

This sketch uses the [circuit with an LED attached](circuit.html#led).

Reading the pot is done the same as above.  Now the task is to send
*analog* output to another pin.  This only works on the digial I/O pins 
that are labelled with a small tilde (`~`) beside the pin number. 
Such pins can write not just digital voltage values (0V and 5V), but 
any one of 256 values in between, using a technique called "Pulse Width
Modulation".  This is a method of turning the voltage `ON` (i.e., 5V)
and then `OFF` (i.e., 0V) rapidly, so that the average voltage is some
value between 0V and 5V.  The relative amount of time spent in the `ON`
state determines the value of the voltage sensed by the device attached
to the pin.

Since `analogRead()` reports values between 0 and 1023, while
`analogWrite()` can only output values between 0 and 255, you must
divide the voltage read from the pot by 4 in order to compute the
output voltage that will be written using `analogWrite()`.

    int LED = 10;
    int POTPIN = 0;
    
    void setup() {
      Serial.begin(57600);
      pinMode(LED, OUTPUT);
      pinMode(POTPIN, INPUT);
    }
    
    void loop() {
      int vInput = analogRead(POTPIN);
      Serial.println(vInput);
      analogWrite(LED, vInput/4);
      delay(1000);
    }
    
### Control the blink rate of an LED using a pot ###

In this example, the voltage read from the pot is used to vary the blink 
rate of an LED.  This sketch uses the same circuit as above, and assumes 
that the LED will be illuminated at full brightness whenever it is on.  

Since, for this sketch, the LED will always be fully `ON` or `OFF`, it
can be attached to any digital I/O pin; it doesn't have to be attached
to one of the PWM pins.

The sketch uses the voltage read from the pot to vary the LED blink 
time from a minimum of 50 ms to a maximum of about 500ms:

| Analog Input Reading | Blink Time in msec |
|:---------------------|:-------------------| 
| 0                    | 50 msec            |
| 1023                 | 500 msec           |

In other words, the range of analog input values (0-1023) is roughly
twice the range of blink periods (50-500).  This desired outcome can be 
achieved if we simply divide the analog input signal by a factor of 2, 
then add 50 ms:

    blink_time = vInput/2 + 50


The following sketch produces the desired outcome:

    int LED=10;
    int POT=0;
    int minBlinkTime = 50;
    
    void setup() {
      Serial.begin(57600);
      pinMode(LED, OUTPUT);
      pinMode(POT, INPUT);
      digitalWrite(LED, LOW);
    }
    
    void loop() {
      int vInput = analogRead(POT);
      Serial.println(vin);
      blink(vInput/2 + minBlinkTime);
    }
    
    void blink(int blinkTime) {
      digitalWrite(LED, HIGH);
      delay(blinkTime);
      digitalWrite(LED, LOW);
      delay(blinkTime);
    }
    
For the curious:  the expression used above to calculate the 
`blinkTime` corresponding to a given `vInput` is an approximation; using
this expression, the maximum value of `blink_time` will actually be 
561ms, not 500ms.  To get the exact range, 50-500ms without solving a 
math problem, use the built-in arduino function `map()`, which
takes 5 arguments (the analog voltage reading, and the minium and maximum
values of the analog voltage reading and the desired blink times):

    int blinkTime = map (vInput, 0, 1023, 50, 500);

Then call `blink()` similarly to the above:

    blink(blinkTime);
