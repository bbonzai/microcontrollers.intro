## Circuits That Use the Serial Console ##

Any one of these circuits would work for the functions demonstrated in this packet:

* [Blinking the on-board LED](../../1-LED/1a-OnBoardLED/circuit.html)
* [Blinking an external LED](../../1-LED/1b-ExternalLED/circuit.html)
* [Blinking all or any one of serveral external LEDs](../../1-LED/1c-SeveralLEDs/circuit.html)

Two data lines are requires for serial communications:

* one line for data received by the Arduino (aka `RX`).  By default, the
pin labelled `0` on most Arduino boards is used for this function.  So if you
have something else connected to that pin, then the Arduino will not be
able to receive data from your keyboard.

* one line for data sent (transmitted) by the Arduino (aka `TX`).  By default, the
pin lablled `1` on most Arduino boards is used to transmit data.  If you
have something else connected to Pin 1, you will not be able to receive data
over the Serial Console.


