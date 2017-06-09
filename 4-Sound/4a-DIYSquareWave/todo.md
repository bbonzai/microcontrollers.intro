## To Do ##

1. Modify the sample code to make High C instead of Middle C.

2. Modify the sample code so that the lower note lasts twice as long as the higher note.

3. Add another note to the sample code.  Your new note need not be another octave higher
or lower than `C`; it could be anything.  (Humans can't hear notes lower than about 
20 Hz or higher than about 20000 Hz.  Piezo buzzers are actually much more limited than
that--they rarely produce much sound outside the range of about 1500 Hz to 3500 Hz.)
Be sure to adjust the number of iterations of your loop so that the new note lasts 
long enough for you to hear.
Remember, if the period is `N`, then the time for the `HIGH` state is half that, or `N/2`,
and the time for the `LOW` state is the other half, also `N/2`.  


4. Modify the sample code to produce a whole octave.  The table below gives the
data to make sounds from one octave below "Middle C" to "Middle C" itself.  
(Note that, unlike previous examples, where "Middle C" was *approximated* as 
250 Hz, in the table below, "Middle C" is taken to be exactly 262.6 Hz, so 
the half-period is slightly shorter than the previous example, and the 
number of vibrations needed to make it last exactly 1 second is slightly larger.)

| Note      | Frequency (Hz)   | HalfPeriod (microSec) | Vibrations in 1 sec |
|:---------:|:----------------:|:---------------------:|:-------------------:|
| C ("Do")  | 130.8            | 3823                  | 131                 |
| D ("Re")  | 146.8            | 3406                  | 147                 |
| E ("Mi")  | 164.8            | 3033                  | 165                 |
| F ("Fa")  | 174.6            | 2864                  | 175                 |
| G ("Sol") | 196              | 2551                  | 196                 |
| A ("La")  | 220              | 2273                  | 220                 |
| B ("Ti")  | 246.9            | 2025                  | 247                 |
| C ("Do")  | 261.6            | 1911                  | 262                 |


5. Modify your code so that the on-board LED turns on briefly (say, 100 millisec)
before you make the buzzer emit a sound.
