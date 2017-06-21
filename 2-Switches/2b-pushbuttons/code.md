## Code to Respond to a Pushbutton Switch ##

### Reading the Switch Position ###

This sketch uses the [circuit containing the pushbutton alone](circuit.html#pushbutton).

It assumes that one end of the switch is connected to `5V`, while the other
end is connected to a resistor and then to `GND`, and *also* to pin 4.
When the pushbutton is pressed, pin 4 should go `HIGH`.  The value `HIGH`
is seen on the Serial Console as a `1`.

To read the value of an input switch use the Arduino command:

    digitalRead(pinNumber);

This will return `1` when the pin is `HIGH` (i.e., near 5V); it will
otherwise return `0`.

The full sketch is below:

    int SW = 4;
    
    void setup(void) {
      Serial.begin(9600);
      pinMode(SW, INPUT);
    }
    
    void loop() {
      Serial.print("Digital reading of the switch input pin: ");
      Serial.println(digitalRead(SW));
      delay(200);   
    }

This resistor is therefore called a "pull-down" resistor, since it ensures 
that `SW` is normally held at exactly 0V.

### Adding an LED ###

This sketch uses the same circuit as above, [modified to include an
LED](circuit.html#pullodwn).  As above, the digital pin attached to
the pushbutton switch is normally in the `LOW` state.  When the pushbutton
is pressed, that digital pin goes `HIGH`; then the LED is turned `ON`.

    int LED = 10;
    int SW = 4;
    
    void setup(void) {
      Serial.begin(9600);
      pinMode(LED, OUTPUT);
      digitalWrite(LED, LOW);
      pinMode(SW, INPUT);
    }
    
    void loop() {
      
      if (digitalRead(SW)) {
          digitalWrite(LED, HIGH);
      }
      Serial.print("Digital reading of the switch input pin: ");
      Serial.println(digitalRead(SW));
      digitalWrite(LED, LOW);

      delay(200);
    }
    
The arduino library gives the value `1` to the constants `HIGH` and 
`true`, so any of the following expression could have been used in
the sketch above to test the switch condition:

      digitalRead(SW) == 1
      digitalRead(SW) == true
      digitalRead(SW) == HIGH
      digitalRead(SW)

### Re-write for the case where the pushbutton is normally `HIGH` ###

This sketch uses the ["input pullup" circuit](circuit.html#pullup) where the 
pin attached to the pushbutton switch is normally in the `HIGH` state.  
When the pushbutton is pressed, that digital pin goes `LOW`; then the LED 
is turned `ON`.

Note that this circuit exploits the internal pullup resistor that
is available for each of the digital I/O pins.  To activate this resistor,
the call to `pinMode` in the `setup` function must be modified:

    pinMode(SW, INPUT_PULLUP);

The revised `loop` function tests when the pushbutton has been
pressed by checking when this pin goes `LOW`:

    int LED = 10;
    int SW = 4;
    
    void setup(void) {
      Serial.begin(9600);
      pinMode(LED, OUTPUT);
      digitalWrite(LED, LOW);
      pinMode(SW, INPUT_PULLUP);
    }
    
    void loop() {
      if (digitalRead(SW) == LOW) {
          digitalWrite(LED, HIGH);
      }
      delay(200);
      
      Serial.print("Digital reading of the switch input pin: ");
      Serial.println(digitalRead(SW));
      digitalWrite(LED, LOW);
    }

The arduino library gives the value `0` to the constants `LOW` and 
`false`, so any of the following expression could have been used in
the sketch above to test the switch condition:

      digitalRead(SW) == 0
      digitalRead(SW) == false
      digitalRead(SW) == LOW
      !(digitalRead(SW))

