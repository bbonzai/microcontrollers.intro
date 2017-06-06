## Code to Control a Servo Position Interactively ##

### Interactive Servo Control: Simple Case (no value checking) ###

Prompt the user for an angle between 0° and 180°, and then move
the servo to the specified angle.

    int servoPin=9;
    Servo s;                  // Initialize a Servo object
    
    void setup(){  
        Serial.begin(115200); // Serial Console, when opened, will communicate at 115200 bps
        s.write(90);          // Set the initial servo position
        s.attach(servoPin);   // Power the servo
        delay(500);           // Wait a little while for the servo to get there
    }
    
    void loop(){
        int angle;

	Serial.println("Input an angle (0-180): "); // Prompt the user for input
	/* Now wait until there is something available from the serial console
	   Serial.available() returns TRUE when something is available.
	   !Serial.available() returns TRUE when nothing is available.
	   So this loop says, "While nothing is available, execute these steps: {}
	   That is, wait and do nothing.
        */
        while (!Serial.available()) {}              

	// If we get past the statement above, there must be something available
	angle = Serial.parseInt();
        s.write(angle);       // Move to specified angle
        delay(1000);          // Wait for the servo to get there
    }

### Interactive Servo Control (with Value Checking) ###

It is good practice never to anticipate that whenever a user is prompted for
input, he/she will respond with a value that just won't work for some reason.
The sketch below just checks that the user input a value in the range the
servo needs, i.e., an integer between 0° and 180°.

    void loop(){
        int angle;

	Serial.println("Input an angle (0-180): "); // Prompt the user for input
        while (!Serial.available()) {}              

	// If we get past the statement above, there must be something available
	angle = Serial.parseInt();
	if ((angle < 0) || (angle > 180)) {
	    Serial.println("Angle is out of range; try again");
        } else {
            s.write(angle);       // Move to specified angle
            delay(1000);          // Wait for the servo to get there
	}
    }
