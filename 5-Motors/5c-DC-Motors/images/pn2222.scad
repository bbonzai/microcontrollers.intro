// Units in mm.
unit=0.5;
diode_diameter = 40*unit;
diode_height = 45*unit;
cutoutf_y=15*unit;
cutoutf_x = diode_diameter/2;
cutoutf_ys = diode_diameter - cutoutf_x;
cutouts_x = 3.5*unit*2;
cutouts_y = diode_diameter;
cutouts_ys = diode_diameter - cutouts_x;
pindiameter=2.5*unit;
pinheight=3.0*diode_diameter;
pinoffsetx = diode_diameter/2.85;
ff=0.1;    // fudge factor

rotate([-90,0,0]){
color([0.45,0.45,0.45]) {
difference() {
  difference() {
    difference() {
      cylinder(r=diode_diameter/2, h=diode_height, $fn=100);
      translate([-cutoutf_x, -cutoutf_ys, -ff/2]) cube([diode_diameter, cutoutf_y, diode_height+ff]);
    }
    translate([(diode_diameter/2)-cutouts_x,-cutouts_ys, -ff/2]) cube([cutouts_x, cutouts_y, diode_height+ff]);
  }
  translate([(-diode_diameter/2),-cutouts_ys, -ff/2]) cube([cutouts_x, cutouts_y, diode_height+ff]);
}
}

 color([0.95,0.95,0.95]) {
  translate([0,0,-pinheight]) cylinder(r=pindiameter, h=pinheight, $fn=100);
  translate([pinoffsetx,0,-pinheight]) cylinder(r=pindiameter, h=pinheight, $fn=100);
 translate([-pinoffsetx,0,-pinheight]) cylinder(r=pindiameter, h=pinheight, $fn=100);   
}
}

// Make the Emitter green, since it carries the signal
color([0,1,0])
translate([-2.6*pinoffsetx,-75]){text("E", size=12,font="Liberation Sans:style=Bold");}

// Make the Base red, since it goes to the thing being driven
color([1,0,0])
translate([-0.70*pinoffsetx,-78]){text("B", size=12,font="Liberation Sans:style=Bold");}

// Make the collector black since it goes to ground
color([0,0,0])
translate([1.40*pinoffsetx,-75]){text("C", size=12,font="Liberation Sans:style=Bold");}

