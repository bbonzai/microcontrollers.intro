## Overall Design of the Code ##

The code for this project includes two separate sequences for controlling the
water jet:

* a series of 8 on/off bursts, where the first ON state lasts 2048 msec, and each
subseqeuent state lasts half as long.  Thus the shortest ON state is 16 msec.
This is followed by another similar series with ON states increasing from  
16 msec back up to 2048 msec.  In all cases, the OFF state is fixed at 400 msec.

* a series of bursts which are timed to occur simultaneously with the 8 famous
notes at the beginning of Beethoven's Fifth Symphony.  The delay between the "short"
notes is 70 msec, and the delay following the "long" note is 110 msec.

Because it is controlling a rapid gush of water, we expected the solenoid to 
show some lag relative to the LED (which is turned ON and OFF almost exactly 
at the same time as the solenoid).
The first (decreasing-then-increasing) time series allows us to measure the
amount by which the solenoid lags the LED, and therefore how fast the solenoid
can respond to a changing input.

[At this point, we should say something about the limits on coordinating with
Beethoven's 5th, given the delay times seen in the video.]

    int externalLED=3; 
    int onBoardLED=13;
    int SPKR=7;
    int solenoid=8;
    
    void beethoven() {
        float freq_G = 196;
        float freq_Eb = 155.6;
        float freq_F = 174.6; 
        float freq_D = 146.8;
         
        for (int i=1; i<4;i++){
      //   Serial.println(i);
          makesound(freq_G, 0.07);
          delay(110);
        }
        delay(70);
        makesound(freq_Eb, 1);
        
        delay(900);  // delay between bars
        
        for (int i=1; i<4; i++) {
      //   Serial.println(i);
          makesound(freq_F, 0.07);
          delay(110);
        }
        delay(70);
        makesound(freq_D, 1);
        
        delay(1200);  // delay at end of "phrase"
    }
    
    void makesound(float freq, float duration) {
        int p = (int)((1000000/freq)/2);
        int nloops = (int)(duration * freq);
        digitalWrite(externalLED, HIGH);
        digitalWrite(onBoardLED, HIGH);
       /* if (duration > 0.5) */ digitalWrite(solenoid, HIGH);  
        for (int i=0; i<nloops; i++) {
            digitalWrite(SPKR, HIGH);
            delayMicroseconds(p);
            digitalWrite(SPKR, LOW);
            delayMicroseconds(p);
        }
        /*if (duration > 0.5) */ digitalWrite(solenoid, LOW);
        digitalWrite(externalLED, LOW);
        digitalWrite(onBoardLED, LOW);
    }   
    
    void timing_sequence() {
        int delayTime=2048;
        int floatDelay=400;
        for (int i=0; i < 7; i++) {   
          for (int j=0; j<3; j++) {
            digitalWrite(solenoid, HIGH);
            digitalWrite(onBoardLED, HIGH);
         //   digitalWrite(SPKR, HIGH);
            delay(delayTime);
           Serial.println(delayTime); 
            digitalWrite(solenoid, LOW);
            digitalWrite(onBoardLED, LOW);
          //  digitalWrite(SPKR, LOW);
            delay(floatDelay);
          }
       //     Serial.println(delayTime); 
            delayTime = delayTime * 0.5;
        } 
        for (int i=0; i < 7; i++) { 
              for (int j=0; j<3; j++) {
            digitalWrite(solenoid, HIGH);
            digitalWrite(onBoardLED, HIGH);
           // digitalWrite(SPKR, HIGH);
            delay(delayTime);
            Serial.println(delayTime); 
            digitalWrite(solenoid, LOW);
            digitalWrite(onBoardLED, LOW);
           // digitalWrite(SPKR, LOW);
            delay(floatDelay);
              }
        //    Serial.println(delayTime);
            delayTime = delayTime * 2;
        } 
        delay(3000);
    }
    
    void setup(void) {
      Serial.begin(115200);
        pinMode(SPKR, OUTPUT); 
        pinMode(externalLED, OUTPUT);
        pinMode(onBoardLED, OUTPUT);
        pinMode(solenoid, OUTPUT);
        digitalWrite(SPKR, LOW);
        digitalWrite(externalLED, LOW);
        digitalWrite(onBoardLED, LOW);
    }
      
    
    void loop() {
        for (int i=0; i<2; i++) timing_sequence();    
        for (int i=0; i<3; i++) beethoven();    
    }
    
