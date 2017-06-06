## Code to Output Strings to the Serial Console ##

The following sketch prompts the user to input an integer, and then
outputs the square of the number back to the console. 

    void setup() {
      Serial.begin(115200);
      Serial.println("Enter a number, the output is its square");
    }

    void loop() {
      if (Serial.available()) {
        long n = Serial.parseInt();
        Serial.print(n);
        Serial.print("^2 = ");
        Serial.println(n*n);
      }
    }

Three separate invocations of `Serial.print()` are required above because
`Serial.print()` and `Serial.println()` can take only one argument.  To get
around this, you can concatenate separate components of an output line
into a string before printing it, using the `+` operator on strings, as 
shown in the example below:

    void setup() {
      Serial.begin(115200);
    }
    
    void loop() {
      Serial.println("Enter an integer");
      // Here's another way to wait for input
      while(!Serial.available()) {} 
      int n = Serial.parseInt();
      String output=(String)n + "^2 = " + (String)(n*n);
      Serial.println(output);
    }
    
    
The following sketch prompts the user for a character, and blinks an
LED associated with that character.

    int rled = 13;
    int gled = 4;
    int yled = 5;
    
    void setup() {
      pinMode(rled, OUTPUT);
      pinMode(gled, OUTPUT);
      pinMode(yled, OUTPUT);
      Serial.begin(115200);
    }
    
    void loop() {
      Serial.println("Which LED do you want to turn on (R/G/B)?");
      while (!Serial.available()) {}
        char c = Serial.read();
              
        if (c == 'r') blink(rled);
        if (c == 'g') blink(gled);
        if (c == 'y') blink(yled);
    }
    
    void blink(int pin) {
      for (int i=0; i<3; i++) {
        digitalWrite(pin, HIGH);
        delay(1000);
        digitalWrite(pin, LOW);
        delay(1000);
      }
    }



