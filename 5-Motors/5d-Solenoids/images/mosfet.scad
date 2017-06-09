// Units in mm.

width=5;
depth=0.4*width;
height=1.1*width;
halfwd=width/2;

widthp=0.75*width;
depthp=0.2*widthp;
heightp=1.25*height;

pindiameter=0.25;
pinheight=3.5*height;
pinoffsetx = width/2.85;
ff=0.1;    // fudge factor

// This will have a corner at the origin
color([0.45,0.45,0.45]) {
  translate([-halfwd, -depth, 0]) cube([width, depth, height]);
}

color([0.95,0.95,0.95]) {
  translate([-widthp/2, -depthp/2, 0]) cube([widthp, depthp, heightp]);
}

color([0.95,0.95,0.95]) {
  translate([0,0,-pinheight]) cylinder(r=pindiameter, h=pinheight, $fn=100);
  translate([pinoffsetx,0,-pinheight]) cylinder(r=pindiameter, h=pinheight, $fn=100);
 translate([-pinoffsetx,0,-pinheight]) cylinder(r=pindiameter, h=pinheight, $fn=100);   
}