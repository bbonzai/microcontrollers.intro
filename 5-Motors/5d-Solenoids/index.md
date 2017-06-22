## Solenoids ##

A solenoid is like a motor, in that both are "actuators", i.e., a device
that makes something else move.  The difference is:

* motors make things move *around* (by turning a spindle) 
* solenoids make things move forward or backward 

This packet shows how to control either one of two solenoids, both of
which are integrated into water valves:

Both of these devices are *extremely* power hungry.  The Arduino cannot
possibly provide the current to make them work.  However, as in the
case of [high-powered speakers](../../4-Sound/4d-speakers), the Arduino can
be used to control when/how the current from another device to the
solenoid is turned on or off.  

Because of the high power requirement, the solenoids in this example
are controlled by a MOSFET rather than a transistor, because the MOSFET
has extremely low resistance and therefore won't get so hot when 
controlling a high current flow.  


