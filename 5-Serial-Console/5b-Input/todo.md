%
% Susan G. Kleinmann
% June 29, 2016

1.  Prompt the user for a value between 0 and 1024.  Then use the `map()` function to
convert that value into the corresponding value between 0 and 255:

    int input_value = Serial.parseInt();
    int output_value map(input_value, 0, 1024, 0 255);

> Then display the `output_value` in the Serial console.

2.  Prompt the user to input three integers.  Then sum the result and output the answer.

