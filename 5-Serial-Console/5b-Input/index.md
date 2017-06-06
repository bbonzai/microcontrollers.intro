## Interactivity: Enabling User Input to Your Arduino ##

This packet shows how to use the Arduino Serial Console to:

* prompt the user for input, then
* process the result, and finally
* produce output on the Serial Console.

### Waiting for Input ###

The biggest challenge in getting accurate input from the Arduino's Serial Console is
just waiting for it.

For example, a quick read of the reference page for `Serial.*` functions 
on the Arduino web site might suggest that your program could read a character
from the Serial Console using a command like:

    char c = Serial.read();

But in general,  that command produces gibberish unless the microcontroller has
actually captured an input keystroke and is ready to deliver it.  To ensure success,
it is necessary to make your program wait a while til that condition is satisfied.
While your program is waiting, it needs to test whether any value is *available* to
the serial console.  

Any one of a variety of test procedures will work, e.g.:

    if (Serial.available()) {     // don't enter this block until Serial data is available
        char c = Serial.read();
    }

Here's another procedure that does the same thing:

    while !(Serial.available());  // loop endlessly until Serial data is available
    char c = Serial.read();

For a refresher background on using the `if` statement or the `while` statement,
see these [packets](../../2-Program-Control/).

    

