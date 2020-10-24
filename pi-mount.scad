include <gamecube-measurements.scad>
include <pi-measurements.scad>
use <common.scad>

wr = 0.1;
hwr = wr/2;

mountWidth = gcWidth - gcWallThickness*2 - wr;
mountHeight = gcHeight - gcWallThickness*2 - wr;
mountThickness = 1;
barWidth = 7;
postHeight = gcBaseDepth - gcBaseThickness;
pegHeight = piBoardThickness * 3;

piInsetX = -0.1 + piUSBStickout;
piInsetY = 0;

module piPlatePost() {
    $fn=36;
    cylinder(d = piScrewHoleSafeDiameter, h = postHeight);
    cylinder(d = piScrewHoleDiameter - hwr, h = postHeight + pegHeight);
}

module piMount() {
    // bars for the whole square
    difference() {
        roundedCube(mountWidth, mountHeight, mountThickness, r = piScrewHoleSafeDiameter/2);
        translate([barWidth, barWidth, -0.1])
            cube([mountWidth - barWidth*2, mountHeight-barWidth*2, mountThickness+0.2]);
    }
    // bar for the lower pegs
    translate([0, mountHeight - piBoardHeight, 0])
        cube([mountWidth, barWidth, mountThickness]);
    // mount pegs
    translate([piInsetX + piScrewHoleInset, mountHeight - piScrewHoleInset, 0])
        piPlatePost();
    translate([piInsetX + piScrewHoleInset, mountHeight - piBoardHeight + piScrewHoleInset, 0])
        piPlatePost();
    translate([piInsetX + piBoardWidth - piScrewHoleInset, mountHeight - piScrewHoleInset, 0])
        piPlatePost();
    translate([piInsetX + piBoardWidth - piScrewHoleInset, mountHeight - piBoardHeight + piScrewHoleInset, 0])
        piPlatePost();
}

piMount();

