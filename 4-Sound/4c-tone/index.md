## Using the Arduino `tone()` Function ##

Rather than generate your own square wave to turn ON and then OFF an
Arduino I/O pin, you could use the Arduino `tone()` function.

Advantages of `tone()`:

1. Your sketch is simpler and easier to write.

2. Get "better" sound, because `tone()` uses a built-in "Timer" on the 
microcontroller chip to produce accurate square waves which
turn on and off at precise times.   

Disadvantages of using `tone()`

1. The particular timer used by `tone()` ("Timer 2") might not be available on 
your microcontroller board.

2.  You might need Timer 2 for other functions, depending on your application.
For example, the so-called "PWM" functions, which are widely used to control
servo-motors, also use Timer 2, thus conflicting with the `tone()` function.

> ⚠Alert! Any time you use code or invoke a library that uses one of the microcontroller's
> timers, be sure to check whether that code conflicts with some other timing-sensitive
> aspect of your program!

### Calling `tone()` to make a sound forever ###

If you invoke `tone()` with 2 arguments, it will make a sound forever.
The arguments should be:

| First argument:  | the pin number where the buzzer or speaker is attached |
| Second argument: | the frequency of the tone you want to make             | 

For example, make "Middle C" (262 Hz):

    tone(BUZZER,262);

To turn off that sound, invoke another function, `notone()`, with one
argument:

    notone(BUZZER);

### Calling `tone()` for a specified period of time ###

If you call the function `tone()` with 3 arguments, the last one is taken to be
the duration of the tone in milliseconds:

    tone(6, 440, 3000);  // Generate middle A (440 Hz) on pin 6 for 3 seconds.

In this case, it is not necessary to call `notone()`. 

### Other Tone Libraries ###

Arduino fans around the world have written a number of alternatives to the 
standard `tone()` library, including

* the [`toneAC` library](https://bitbucket.org/teckel12/arduino-toneac/wiki/Home) 
(i.e., collection of functions), which produces louder sounds and 
offers some volume control.
* the [`NewTone` library](https://bitbucket.org/teckel12/arduino-new-tone/wiki/Home) 
which produces smaller, more efficient code, and uses Timer1 rather than Timer 2
* the [TimerFreeTone library](http://forum.arduino.cc/index.php?topic=235774.0)  which 
has the benefit that it doesn't use any timers at all.

