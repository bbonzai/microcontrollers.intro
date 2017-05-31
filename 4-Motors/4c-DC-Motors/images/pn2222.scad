// Units in mm.
diode_diameter = 4;
diode_height = 5;
cutoutf_y=1.5;
cutoutf_x = diode_diameter/2;
cutoutf_ys = diode_diameter - cutoutf_x;
cutouts_x = 0.25;
cutouts_y = diode_diameter;
cutouts_ys = diode_diameter - cutouts_x;
pindiameter=0.25;
pinheight=3.5*diode_diameter;
pinoffsetx = diode_diameter/2.85;
ff=0.1;    // fudge factor

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