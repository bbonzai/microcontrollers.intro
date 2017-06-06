## Laser Tag ##

This project is a game where the player uses a laser pointer to 
activate a light sensor.  When the light shines on the sensor, the sensor activates
a servo motor to move a flag through an arc.  But if the player can't keep the
laser focussed on the sensor, then the servo moves backwards.  If the player
can keep the laser pointed at the sensor for long enough, then the servo moves
through its full arc; at that point, lights flash to congratulate the player,
the servo goes back to the staring position, and after a short delay, is ready
for the next player.  The critical components of this game are:

* a laser-pointer, and
* an Arduino setup where a light sensor drives a servo when the laser impacts the sensor.

