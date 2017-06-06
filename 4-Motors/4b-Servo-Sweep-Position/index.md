## Smooth Motion with a Hobby Servo ##

### Simulating Smooth Motion Using Small Steps ###

The `.write(n)` method in the Servo library allows the use of two different
ranges of values to set the servo's positon:

* If `n` is an integer between 0 and 180, `.write(n)` will interpret `n` as
an angle between 0° and 180°, and the step size is 1°.  

* If `n` is an integer between 544 and 2400, `.write(n)` will interpret `n` 
as the number of microseconds of the pulse being sent to the servo,
and the step size is 1 microSecond.  
In this way, the servo can be moved by just under 0.1° with each step.
By specifying small steps, it is possible to simulate smooth motion with

The exact range of steps allowed by a particular servo depends on the
model.  A TowerPro SG90 has the following (typical) specs:

* a pulse width of 1ms (`.write(1000)`) takes the servo all the way to the left. 
* a pulse width of 1.5ms (`.write(1500)`) takes the servo to its center position.
* a pulse width of 2ms (`.write(2000)`) takes the servo all the way to the right.

Since there are 1000 steps between the two extreme positions which are 180°
apart, this servo can be stepped in 0.2° increments.

By making the servo move in small steps with small delays between each step,
you can simulate smooth motion on a standard hobby servo.

### Real Smooth Motion Using Constant Velocity Requires a Modded Servo ###  

Soon after RC cars became available with servo motors, hobbyists learned
how to "mod" the motors so that they could execute continuous motion, i.e.,
motion to any angle, not just 0° through 180°.  These "modded" servo are
called "continuous rotation servos".  This type of mod became so popular
that nowadays many manufacturers provide continuous rotation servos in their
product line-up.  They are not much more expensive (if at all) than
regular, unmodded servos.

If you use the Arduino Servo library to control a continuous rotation
servo, then its `.write()` method sets the speed, but not the position:

* `.write(0)` moves a CRS full-speed in one direction,
* `.write(90)` stops the servo,
* `.write(180)` moves a CRS at full-speed in the opposite direction.
