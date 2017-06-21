## Using a Slide Switch ##

### Alternating Lights (Arduino is just a power supply) ###

The first example is bare bones: a slide switch is used to activate *either*
a red LED or a yellow LED.  In fact, no Arduino is needed to make LEDs behave
this way; the same outcome could be achieved without the Arduino at all.

The code checks whether the slide switch is in a position to turn on the
digital pin named `SW1`, and if so, it causes the red LED (attached 
to pin `LEDR`) to turn on, and the yellow LED (attached to pin `LEDY`) to turn off.

If the slide switch is in the opposite position, then the `LEDR` is turned off
and `LEDY` is turned on.


```int SW1=13;
int SW2=12;

int LEDR=4;
int LEDY=3;
    
void setup(void) {
    pinMode(SW1,INPUT);
    pinMode(SW2,INPUT);
    pinMode(LEDR,OUTPUT);
    pinMode(LEDY,OUTPUT);
    digitalWrite(LEDR, LOW);
    digitalWrite(LEDY, LOW);
}
  
void loop(void) {
    if (digitalRead(SW1) == HIGH) {
    digitalWrite(LEDR, HIGH);
    digitalWrite(LEDY, LOW);
    delay(100);
} else {
    digitalWrite(LEDR, LOW);
    digitalWrite(LEDY, HIGH);
    delay(100);
}
```


### Use Switch to Change the Timing ###

In this example, the switch is used to tell the Arduino to change the
timing pattern, from:

* both LEDs flashing for a long-ish time (1s), to
* both LEDs flashing for a much shorter time (0.2s).

```int SW1=13;
int SW2=12;

int LEDR=4;
int LEDY=3;

int DIT = 100;
int DAH = 1000;

int onTime;
int offTime;

void setup(void) {
    pinMode(SW1,INPUT);
    pinMode(SW2,INPUT);
    pinMode(LEDR,OUTPUT);
    pinMode(LEDY,OUTPUT);
    digitalWrite(LEDR, LOW);
    digitalWrite(LEDY, LOW);
    onTime  = DIT;
    offTime = 1000;
}
    
void loop(void) {
    if (digitalRead(SW1) == HIGH) {
        onTime = DAH;
    } else {
        onTime = DIT;
    }

    digitalWrite(LEDR, HIGH);
    digitalWrite(LEDY, HIGH);
    delay(onTime);
    digitalWrite(LEDR, LOW);
    digitalWrite(LEDY, LOW);
    delay(offTime);
}
```
