# First steps in using `arduino` with an Arduino controller board #

If you can blink an LED, you are on your way to becoming an Arduino master!

## Blinking the On-Board LED ##

Every Arduino board comes equipped with an LED on it.  This LED can be 
programmed, providing a convenient means of checking that your `arduino` 
software and connection to your board are set up correctly.

The instruction packet "[1a-OnBoardLED](1a-OnBoardLED)" shows how to 
make your on-board LED "blink".  This packet also illustrates the general
structure of any `arduino` program, and shows how to upload the program 
to your board.

## Blinking an External LED ##

An Arduino master's ultimate objective is to control control external devices
like lights, speakers, motors, and of course water squirters.  
The instruction packet [1b-ExternalLED](1b-ExternalLED)" shows how to 
take the first step:  how to build and control a circuit with a single *external* 
LED.  In the process, this packet also shows how to use breadboards to make 
test circuits.  

And for a deep dive, you can use the LED to send Morse code.

## Blinking a Bunch of LEDs ##

An easy and obvious extension to the above is to control many LEDs.  

The packet "[1c-SeveralLEDs](1c-SeveralLEDs)" shows a rudimentary way 
to simulate a traffic stoplight using one red, one green, and one yellow LED.
