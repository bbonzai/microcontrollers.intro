## Using a Pushbutton Switch ##

### Read Switch Position Using Serial Console ### 

For this circuit, you will only need:

* an Arduino
* a pushbutton
* some jumper cables

Either of the following circuits will work for this purpose.

| Pushbutton connections both on one side  | Pushbutton connections on alternate sides |
|:----------------------------------------:|:-----------------------------------------:|
| [](images/pushbuttonAlone1_bb.svg.png)   | [](images/pushbuttonAlone2_bb.svg.png)    |

### Add an LED; Turn It `ON` When the Switch Goes `HIGH` ### {#pulldown} 

Add these pieces to the above circuit:

* an LED
* a 220Ω resistor

Connect the anode (the long lead) of the LED to a digital input pin
on the Arduino.

Connect the cathode (the short lead) of the LED to one end of the 
220Ω resistor.  

Connect the other end of the resistor to `GND`.

When you push the pushbutton, current will flow from the `5V` pin 
through the pushbutton to one end of the 10KΩ resistor, to `GND`.
Since you have a cable connecting the `5V` end of the resistor to
pin 10, that pin will go `HIGH`.  Your sketch will detect when that 
pin goes `HIGH`, and will then turn the LED `ON`.

When you release the pushbutton, no current flows from the `5V` pin
through the pushbutton, so both ends of the resistor are at `0V` or `GND`.
Pin 10, which is attached to one end of the reistor, is also at `0V`, and
is therefore `LOW`.  Your sketch will detect that pin 10 is `LOW`, and 
will then turn the LED `OFF`.

| Circuit using Pulldown Resistor                            |
|:----------------------------------------------------------:|
| In this case, the pin is `LOW` unless the button is pushed |
| [](images/pushbuttonInputLow_bb.svg.png)                   |

### Add an LED; Turn It `ON` When the Switch Goes `LOW` ### {#pullup} 

In this case, one end of the switch is connected to `GND`, and the other
end to an input line (12).  The input line is configured with:
pinMode(SW, INPUT_PULLUP).  Then the code tests:

if (! digitalRead(SW)) { 
  digitalWrite(LED, HIGH);
}

Data Pin is by default at GND.

In this case, one end of the switch is connected to `5V`, and the other
end to a resistor, which is then connected to an input line (12).  The 
input line is configured with: pinMode(SW, INPUT).  Then the code tests:


The following circuit shows:

* a pushbutton switch which is connected to the `GND` bus of a 
breadboard and to one of the digital I/O pins on an Arduino UNO

* three LEDs whose anodes (`+`) are connected to various digital I/O pins on an Arduino boards,
and whose cathodes (`-`) are connected to one end of a 220Ω resistor.

* three 220Ω resistors, each connected between the cathodes of an LED and the
`GND` bus of the breadboard.

| Circuit using Internal Pullup Resistor                     |
|:----------------------------------------------------------:|
| In this case, the pin is `LOW` unless the button is pushed |
| [](images/pushbuttonInputHigh_bb.svg.png)                  |
