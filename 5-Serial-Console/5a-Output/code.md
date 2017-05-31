%
% Susan G. Kleinmann
% June 28, 2017

This code is run only once, so all of the statements go in the 
`setup()` function.  The Arduino software won't compile the sketch
without a `loop()` function, so it is present, but empty.

The first command to initiate communication with the Serial console
is:

    Serial.begin(nnn);

where `nnn` is the baud rate (the number of bits per second) used
for communication between the Arduino and the Serial console.

This statement must go in the `setup()` function.

Thereafter:

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

The following sketch produces a table of the first 25 integers and their square roots.

    void setup() {
        Serial.begin(115200);
        Serial.println("Number,Square Root");
        for (int i=1; i<=25; i++) {
            Serial.print(i);     // print an integer
            Serial.print(',');   // print a character
            float si = sqrt(i);        
            Serial.println(si);  // print a float and start a new line of output
        }
    }

    void loop() {
    }


