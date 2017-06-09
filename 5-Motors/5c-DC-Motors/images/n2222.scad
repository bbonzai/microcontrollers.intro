// Units in mm.
dioded = 4;
diode_height = 5;
halfd = dioded/2;
cutoutf_x = dioded/2;
cutoutf_y=1.5;
cutoutf_ys = dioded/2;
xnotch = halfd/4.5;
cutouts_y = dioded;
cutouts_ys = dioded - xnotch;
pindiameter=0.25;
pinheight=3.5*dioded;
pinoffsetx = dioded/2.85;
ff=0.1;    // fudge factor

color([0.45,0.45,0.45]) {
difference() {
  difference() {
    difference() {
      cylinder(r=halfd, h=diode_height, $fn=100);
      translate([-halfd, -2.4*halfd, -ff/2]) cube([dioded, dioded, diode_height+ff]);
    }
    translate([halfd - xnotch, -2.1*halfd, -ff/2]) cube([dioded, dioded, diode_height+ff]);
  }
  translate([-(dioded+halfd-xnotch),-2.1*halfd, -ff/2]) cube([dioded, dioded, diode_height+ff]);
}
}

color([0.95,0.95,0.95]) {
  translate([0,0,-pinheight]) cylinder(r=pindiameter, h=pinheight, $fn=100);
  translate([pinoffsetx,0,-pinheight]) cylinder(r=pindiameter, h=pinheight, $fn=100);
 translate([-pinoffsetx,0,-pinheight]) cylinder(r=pindiameter, h=pinheight, $fn=100);   
}