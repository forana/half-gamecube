$fn = 64;

module roundedCube(w, h, d, r, includeZ = false) {
    ew = w - 2*r;
    eh = h - 2*r;
    ed = d - 2*r;
    if (includeZ) {
        translate([r, r, r]) minkowski() {
            cube([ew, eh, ed]);
            sphere(r=r);
        }
    } else {
        translate([r, r, 0]) minkowski() {
            cube([ew, eh, d]);
            cylinder(r=r, h=d);
        }
    }
}

roundedCube(1,2,3,0.1, includeZ=true);