## Code to Use a CdS Sensor ##

CdS sensors measure the amount of visible light falling on their
front face, but these sensors are not especially consistent, one
to another.  Therefore, it is good practice to begin using a particular
CdS by inspecting the maximum and mimum voltage signals it produces
when exposed to the maximum and minimum light levels you expect it 
to detect.

The first sketch below simple measures the voltage levels from a 
particular CdS sensor.  The second sketch measures the minimum and
maximum values registered by a particular CdS sensor.  The third
sketch uses those extremes to give maximum control to the brightness
of an LED.

### Read the CdS Voltage ###

This sketch reads the voltage drop over a CdS, using the arduino function 
`analogRead()`.  It then writes that function to the Serial Console, 
waits 1 second, and then reads the CdS again.  For more explation
of the use of `analogRead()`, see the packet on using a [pot](../3a-potentiometer/code.html).
 
    int CDSPIN = 0;               // This is analog pin 0, aka "A0"
    
    void setup(){  
        pinMode(POT, INPUT);
        Serial.begin(57600);
    }
    
    void loop(){
      int vInput = analogRead(CDSPIN);
      Serial.println(vInput);
      delay(1000);
    }

### Measure the Maximum and Minimum Signals from a Particular CdS Sensor ###

This sketch remembers the maximum and minimum voltage readings from a 
particular CdS in a particular light environment.  The minium reading
occurs when the CdS sensor is covered with a fingertip.  The maximum 
reading occurs when the CdS sensor is illuminated with a flashlight, held
close to the sensor.  The program also keeps track of the "average" 
reading measured in the last 10 seconds.

The sketch uses the arduino functions `min()` and `max()`.  Each of these
functions takes two arguments (in either order).  These are the two values
being compared.  So in each iteration of the `loop()` function, the sketch
compares the most recent reading of the voltage level from the CdS sensor,
and uses the `min()` function to compare that to the most existing estimate
of the minimum reading.  The same is repeated for the `max()` function.

In the preamble to the sketch, the value for `vmin` is initialized to the
maximum level it could possibly have.  Thus when the voltage of the CdS is
read the first time in the `loop()` function, the value of `vmin` will be 
immediately reduced.  Likewise, in the preamble, the value for `vmax` is 
initialized to the minimum level it could have, and it too is reset in the 
first iteration of the `loop()` function.

    int CDS = 0;
    int vmin = 1024;
    int vmax = 0;
    
    void setup() {
      Serial.begin(57600);
      pinMode(CDS, INPUT);
      Serial.println("Vin Min  Max");
    }
    
    void loop() {
      int vInput = analogRead(CDS);
      if (vInput < vmin) {vmin = vInput;}
      if (vInput > vmax) {vmax = vInput;}
      Serial.print(vInput);
      Serial.print(" ");
      Serial.print(vmin);
      Serial.print(" ");
      Serial.println(vmax);
      delay(1000);
      
    }

The results for a particular CdS sensor and the particular extreme
light conditions (dark = covered by finger; light = lit up by flashlight)
showed that the CdS readings varied from about 200 to 1000.
When neither of those conditions occurs, the CdS reading hovers around 525.
These values are used in the next sketch.

### Control the Brightness of an LED with a CdS Sensor ###

In this sketch, the brightness of an LED is controlled by the voltage
read from the CdS sensor.  This sketch simply follows the same logic as
the [sketch](../3a-potentiometer/code.html) to control the brightness of 
an LED with a pot.  

    int LED = 10;
    int CDS = 0;

    void setup() {
      Serial.begin(57600);
      pinMode(LED, OUTPUT);
      pinMode(CDS, INPUT);
    }
    
    void loop() {
      int vInput = analogRead(CDS);
      Serial.println(vInput);
      analogWrite(LED, vInput/4);
      delay(1000);
    }

Recall from the example [sketch](../3a-potentiometer/code.html) for using a pot
to control the brightness of an LED, the voltage read from an Analog I/O pin 
can range from 0 to 1023, while the analog voltage written to an I/O pin can 
only range from 0 to 255.  The scale difference between `analogRead`'s and 
`analogWrite`'s, which is a factor of 4, is accommodated in the statement:

    analogWrite(LED, vInput/4);

The range of brightnesses achieved by the LED could be slightly enhanced by 
using the actual minimum and maximum brightnesses measured by this particular CdS  
in the example above, where it was seen that the real voltage input ranged from 99 to 999.  
To convert this range of inputs to the desired range of outputs, use arduino's `map()`
function:

    analogWrite(LED, map(vInput, 99, 999, 0, 255);


