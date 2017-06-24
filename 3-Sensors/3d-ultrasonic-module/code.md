## Code to Measure Distance with an Ultrasonic Sensor ##

The following code is a bare-bones demonstration of the use
of the HC-SR04 ultrasonic sensor.  The sensor begins "ranging"
when a voltage pulse (`LOW`->`HIGH->`LOW) is sent to its
"trigger" pin.  The pulse should be short, e.g., 10 μsec.
After this pulse, then the module will send out a train of 
exactly 8 pulses of 40 kHz ultrasound.  If some object is 
within range of the sensor, then these pulses will bounce off 
the object and return to the sensor.  

The received sound can be detected using the Arduino `pulseIn()` 
function on the module's input, pin, aka `echoPin`.  Since the 
speed of sound is a constant,
that time duration can be converted directly into a distance.

The code uses the Arduino `pulseIn()` function to fetch the length of time 
that a pulse remains in the `HIGH` state:

    duration = pulseIn(echoPin, HIGH);

That duration can be converted into a distance using the speed of sound:

    distance = velocity * time
             = speed of sound * duration 

The speed of sound is `34000 cm/s`.  The distance is printed on the Serial Console.

In order to ensure that one train of sound packets does not interfere
with the next train, it is good practice to delay a while between
measurements, e.g., 60 ms.

    const int trigPin = 12;
    const int echoPin = 11;
    
    void setup() {
        pinMode(trigPin, OUTPUT); 
        pinMode(echoPin, INPUT); 
        Serial.begin(115200); 
    }
    
    void loop() {
        digitalWrite(trigPin, LOW);  // Initialize the trigPin
        delayMicroseconds(2);
        digitalWrite(trigPin, HIGH); // Give the sensor the signal to start ranging
        delayMicroseconds(10);
        digitalWrite(trigPin, LOW);
        
	// record the amount of time (in microseconds) that the echoPin stays high.
        unsigned long duration = pulseIn(echoPin, HIGH);  
        
        // This gives the distance in cm
        // The factor of 2 corresponds to the round-trip of the sound wave
        float distance = (duration/1000000) * 34000 / 2
    
        Serial.print("Distance: ");
        Serial.println(distance);
    }
    
