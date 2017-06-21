const int waitInterval = 6000;   // Time to wait for bounce, in MICROsconds
const int LEDpin = 10;                 
const int SW = 4;
bool checkMe = true;
unsigned long    t0 = 0;           // How long between "bounces"

int switchLevel;
int switchLevel0;
 
void setup() {
  pinMode(LEDpin, OUTPUT);
  pinMode(SW, INPUT_PULLUP);
} 

void loop() {
  // If we're watching the button, and
  //   if it changed, then
  // turn off checkme,
  // start the timer clock, and 
  // reset the initial state of the button.
  if (checkMe) {
    switchLevel = digitalRead(SW);  // True if 1 transition occured
    if (switchLevel != switchLevel0 ) {
      checkMe = false;
      t0 = micros();
      switchLevel0 = switchLevel;
    }
  } else {
    // If the clock has run out 
    //   record the current state of the button,
    //   and turn on checkMe!
    if ((micros() - t0) >= waitInterval) {
      switchLevel0 = digitalRead(SW);
      checkMe = true;
    }
  }

  digitalWrite(LEDpin, switchLevel0);
}
 
