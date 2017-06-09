## A Program to Make Comparative Sounds ##

The following sketch makes three sounds:

* Middle C for 0.25s, using the `makeSound()` function introduced in the packe on [DoubleSound](../3b-DoubleSound/code.html).
* Middle C for 0.5s, using the `tone()` function built into the Arduino program.

Note that in order to hear the sound made by `tone()`, it is necessary to add 
a delay that is at least as long as the length of the tone itself.

The combination of these two techniques for generating sound in the same
sketch allows you to see how closely they produce the same sound.

### Compare sounds from `makeSound()` and `tone()` ### 

    int BUZZER=9;

    void setup() {
        pinMode(BUZZER, OUTPUT);
    }

    void loop() {
        makeSound(264, 0.25);
        delay(100);
        makeSound(264, 0.25);
        delay(100);
        tone(BUZZER, 262, 500);
        delay(600);
    }

    void makeSound(float freq, float duration) {
        int p = (int)((1000000/freq)/2);
        int nloops = (int)(duration * freq);
        for (int i=0; i<nloops; i++) {
            digitalWrite(BUZZER, HIGH);
            delayMicroseconds(p);
            digitalWrite(BUZZER, LOW);
            delayMicroseconds(p);
        }
     }   

### Making a Melody ###

The following sketch is adapted from one of the Examples built into the Arduino
software.   Again,  note the large delays that are needed after each call to
the `tone()` function, without which you wouldn't hear any of the notes.

    int BUZZER=9;

    void setup() {
      pinMode(BUZZER, OUTPUT);
    }

    void loop() {
        tone(BUZZER, 262, 250);
        delay(325);
        tone(BUZZER, 196, 125);
        delay(163);
        tone(BUZZER, 196, 125);
        delay(163);
        tone(BUZZER, 220, 250);
        delay(325);
        tone(BUZZER, 196, 250);
        delay(325);
        tone(BUZZER,   0, 250);
        delay(325);
        tone(BUZZER, 247, 250);
        delay(325);
        tone(BUZZER, 262, 250);
        delay(1000);
    }

