include <gamecube-measurements.scad>
include <pi-measurements.scad>
use <common.scad>

wr = 0.1;
hwr = wr/2;

mountWidth = gcWidth - gcWallThickness*2 - wr;
mountHeight = gcHeight - gcWallThickness*2 - wr;
mountThickness = 1;
barWidth = 5;
postHeight = gcBaseDepth - gcBaseThickness - piBoardThickness;
pegHeight = piBoardThickness * 3;

module piPlatePost() {
    $fn=36;
    cylinder(d = 5, h = postHeight);
    cylinder(d = piScrewHoleDiameter - hwr, h = postHeight + pegHeight);
}

module piMount() {
    difference() {
        roundedCube(mountWidth, mountHeight, mountThickness, r = piScrewHoleSafeDiameter/2);
        translate([barWidth, barWidth, -0.1])
            cube([mountWidth - barWidth*3, mountHeight-barWidth*2, mountThickness+0.2]);
    }
    translate([piScrewHoleInset, 1 + mountHeight - piScrewHoleInset, 0])
        piPlatePost();
    translate([piScrewHoleInset, 1 + mountHeight - piBoardHeight + piScrewHoleInset, 0])
        piPlatePost();
    translate([piBoardWidth - piScrewHoleInset, 1 + mountHeight - piScrewHoleInset, 0])
        piPlatePost();
    translate([piBoardWidth - piScrewHoleInset, 1 + mountHeight - piBoardHeight + piScrewHoleInset, 0])
        piPlatePost();
}

module piReoriented(ww=0, wl=0) {
    translate([0, piBoardHeight, piBoardThickness])
        rotate([180, 0, 0])
            piModel3APlus(ww=ww, wl=wl);
}

piMount();
//piReoriented();
