## Interacting with the Serial Console ##

Whether you are using the Arduino send data *to* a Serial Console, or fetch
data *from* the Serial Console, you *must* initialize the Serial Console 
in `setup()`, using the function `Serial.begin()`.  This function sets 
the speed (aka "baud rate") with which the console transmits or receives 
data from the Arduino board.  Typical values are 9600, 57600, or 115200.  
Whatever value you use, it *must* agree with the baud rate reported in the 
bottom line of your Serial console; otherwise you will see no output.  If 
the two values do not agree, use the drop-down menu in the bottom line of 
the Serial Console to make them agree.

Example:

    void setup() {
        Serial.begin(9600);
    }

### Case 1:  Arduino Transmits Data *to* the Serial Console ###

To print any numerical value, use:
: >    `Serial.print(nnn);`
: where `nnn` is the value to be printed.  It can be an integer or
: a floating point number.  In any case *it can only be 1 value*.

To print a literal string, use:
: >    `Serial.print("abc");`
: where "abc" is the string, which must be in double quotes.

To print the value of a numerical, character, or String variable, use:
: >    `Serial.print(foo);`
: where `foo` is the name of the variable.

To ensure that any further output begins on a new line, use this command instead of `Serial.print()`:
: >    `Serial.println(nnn);`      or
: >    `Serial.println("abc");`    or
: >    `Serial.println(foo);`
: as appropriate.

The following program uses the Arduino to write the value of a counter to the 
Serial Console; each value is written on a new line.  After each write, the 
program delays by an amount of time equal to the counter, so it seems to run more 
and more slowly as time goes by.

    int count = 1;
    
    void setup(void) {
      Serial.begin(9600);
    }
    
    void loop(void) {
      count = count + 1;
      Serial.println(count);
      delay(count);
    }
    
The following sketch produces a table of the first 25 integers and their square roots.
It does all its work in the `setup` function, so it runs only once.  The `loop` 
function does nothing (forever).

    void setup() {
        Serial.begin(115200);

        Serial.println(" #  Square Root");
        for (int i=1; i < 10; i++) {
            Serial.print(' ');                    // print preceding space
            Serial.print(i);                      // print an integer
            Serial.print("  ");                   // print a couple of spaces
            Serial.println(sqrt(i));              // print a floating point number
                                                  // and start a new line of output
        }
        for (int i=10; i<=25; i++) {
            Serial.print(i);                      // print an integer
            Serial.print("  ");                   // print a couple of spaces
            Serial.println(sqrt(i));              // print a floating point number
        }
    }

    void loop() {
    }

### Sending Data to the Arduino via the Serial Console ###

The following program asks you for an integer, and then prints that number to
the console, and delays for that number of seconds.  

    void setup() {
        Serial.begin(57600);
        delay(1000);
    }

    void loop() {
        Serial.println("Enter an integer: ");
        if (Serial.available()) {
            int num = Serial.parseInt();
            Serial.print("Now delaying by ");
            Serial.print(num);
            Serial.println(" seconds.");
            delay(num * 1000);
        }
    }

If you run the above program, you will see that it asks you again and again
to "Enter an integer: " before you get a chance to enter that integer.
The following program uses an empty `while` loop to force the Arduino 
to pause until you enter that number.  Rather than testing if input is
available, `while` tests whether input is **not** available by using the
"not" operator, `!`.  So this while statement says, "Do nothing (`{}`) 
while input (`Serial.available()`) is not (`!) true:

    while (! Serial.available()) {     
    }                                

You can also write that on one line:

    while (! Serial.available()) {}

This is a very common construct in programs that use the Serial Console 
for input.

    void setup() {
        Serial.begin(57600);
    }

    void loop() {
        int num = 1;
        Serial.println("Enter an integer: ");

        while ( ! Serial.available()) {}

        num = Serial.parseInt();
        Serial.print("Now delaying by ");
        Serial.print(num);
        Serial.println(" seconds.");

        delay(num * 1000);
    }

The following program causes the on-board LED to blink the number of times
you specify on the Serial Console.

    int LED = 13;

    void setup() {
        Serial.begin(57600);
        pinMode(LED, OUTPUT);
        digitalWrite(LED, LOW);  
    }

    void loop() {
        Serial.println("How many blinks? ");

        while ( ! Serial.available()) {}

        int num = Serial.parseInt();
        for (int i=0; i < num; i++) {
            blink();
        }
    }

    void blink(void) {
        digitalWrite(LED, HIGH);
        delay(500);
        digitalWrite(LED, LOW);
        delay(500);
    }
