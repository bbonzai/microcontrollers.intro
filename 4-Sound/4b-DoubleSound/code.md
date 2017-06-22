## Code to Make a Sound with a Specific Pitch ##

This packet uses a buzzer attached to two I/O pins, called BUZZERRED and BUZZERBLK. The 
sketch defines a [function](../../1-LED/1d-functions), `makesound()`, to

* drive BUZZERRED `HIGH` and BUZZERBLK `LOW`, then
* delay a while, then
* drive the BUZZERRED `LOW`, and BUZZERBLK `HIGH`
* delay a while

`makesound()` takes 2 arguments, a frequency (`float freq`) and a duration (`float duration`).
From these data, it calculates:

* the delay time needed to make the note

> >    half-period (in microseconds) = (1000000/frequency)/2

* the number of vibrations needed to last for the required duration.

> >    number-of-vibrations = duration * frequency

In both cases, a floating point result is calculated from the input data.  But the
subsequent statements that use these data require integer inputs.  So in each
calculation, the resulting `float` is *cast* into an `int` by preceding the 
expression with the operator `(int)`.


### Make 3 Sounds ###

This packet calls a user-defined function `makesound()` 3 times to make 3 notes, 
each for a different duration:

| Note                                            | Frequency | Duration | Half-Period | # Loops |
|:------------------------------------------------|:----------|:---------|:------------|:--------|
| Middle C                                        | 261.6 Hz  | 1 s      | 1911        | 262     |
| Middle D, 1.122x higher than Middle C           | 293.7 Hz  | 2 s      | 1702        | 587     |
| Middle E, 1.122x higher than Middle D           | 311.1 Hz  | 0.5 s    | 1607        | 156     |

After that sequence of sounds, the sketch pauses a couple of seconds before repeating the sequence.

    int BUZZERHI=4;
    int BUZZERLOW=12;

    void setup(void) {
        pinMode(BUZZERHI, OUTPUT);
        pinMode(BUZZERLOW, OUTPUT);
        digitalWrite(BUZZERHI, LOW);
        digitalWrite(BUZZERLOW, LOW);
    }

    void loop() {
        float freq_c = 261.6;
        float freq_d = 293.7;
        float freq_e = 311.1;
         
        makesound(freq_c, 1);
        makesound(freq_d, 2);
        makesound(freq_e, 0.5);
        delay(1000);
    }

    void makesound(float freq, float duration) {
        int p = (int)((1000000/freq)/2);
        int nloops = (int)(duration * freq);
        for (int i=0; i<nloops; i++) {
            digitalWrite(BUZZERHI, HIGH);
            digitalWrite(BUZZERLOW, LOW);
            delayMicroseconds(p);
            digitalWrite(BUZZERHI, LOW);
            digitalWrite(BUZZERLOW, HIGH);
            delayMicroseconds(p);
        }
    }   

