%
% Susan G. Kleinmann
% June 24, 2016

1. Add a "Serial Console" to your sketch, so that you can see on the screen the values
read from the pot as you turn the handle.  To do this, add a line like this to the
`setup()` function:

> >     Serial.begin(115200);

> > Then modify `loop()` to record the `potSetting` values to the console:

> >     Serial.println(potSetting);

2. Replace the servo with an LED (and of course a current-limiting resistor).  Then use 
the pot to change the voltage over the LED (thus making it appear to "glow" when the pot
is turned up to a high value). 

> > To do this, you will need to attach the lED to one of the pins that can output PWM signals.
These pins are marked with a "~" (on an UNO, that would be pins 3,5,6,10, and 11).

> > Then modify the `setup()` function to denote which pin will be used for output:

> >     pinMode(ledPin, OUTPUT);

> > Finally, in the `loop()` function, write to the `ledPin` using `analogWrite()`.
Since `analogWrite()` expects an output value in the range 0 to 255, use
the `map()` function can be used to produce the right value:

> >     ledVal = map(potPin, 0, 1023, 0, 255);

> > Then invoke `analogWrite()` using something like:

> >     analogWrite(ledPin, ledVal);

