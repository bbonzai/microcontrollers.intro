1.  Modify the code so that the lights all blink at the same time.

2.  Modify the code so that it has the "walk-pattern" used in Massachusetts (and in Sweden):

> * Red goes on, then
> * Red and yellow go on (signalling it's OK to walk) , then
> * Red and yellow go off and Green goes on, then
> * Green goes off and Yellow goes on
> * Yellow goes off

3.  Wikipedia has an [interesting page](https://en.wikipedia.org/wiki/Traffic_light)
describing the conventions of real traffic lights.  For example, in some 
jurisdictions, the yellow light depends on the speed limit, adding 1s for each
10 miles/hour.  Set up another variable at the top of the program that 
specifies the speed limit.  Also, declare a variable (called `yellowTime`)
whose initial value is 0.  Then in the `setup()` function, set the value of
`yellowTime` so that it corresponds to your speed limit, and use the value




