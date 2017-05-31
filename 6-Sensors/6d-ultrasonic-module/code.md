%
% Susan G. Kleinmann
% July 7, 2016

The following code was obtained from:
[howtomechatronics](http://howtomechatronics.com/tutorials/arduino/ultrasonic-sensor-hc-sr04/).

    /*
    * Ultrasonic Sensor HC-SR04 and Arduino Tutorial
    * Crated by Dejan Nedelkovski,
    * www.HowToMechatronics.com
    */
    
    // defines pins numbers
    const int trigPin = 12;
    const int echoPin = 11;
    
    // defines variables
    long duration;
    int distance;
    
    void setup() {
        pinMode(trigPin, OUTPUT); 
        pinMode(echoPin, INPUT); 
        Serial.begin(115200); 
    }
    
    void loop() {
        digitalWrite(trigPin, LOW);  // Initialize the trigPin
        delayMicroseconds(2);
        
        digitalWrite(trigPin, HIGH); // Send out a signal
        delayMicroseconds(10);
        digitalWrite(trigPin, LOW);
        
	// wait for echo pin to go HIGH, then report the amount of time
	// before it goes back to LOW. 
        duration = pulseIn(echoPin, HIGH);  
        
        distance= duration*0.034/2;
    
        Serial.print("Distance: ");
        Serial.println(distance);
    }
    
