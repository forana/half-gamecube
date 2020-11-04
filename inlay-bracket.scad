include <gamecube-measurements.scad>
use <gamecube-base.scad>
use <common.scad>

wr = 0.1;
hwr = wr/2;

usbBracketStickout = 5.7 + 2.15;

usbHubInset = 12.5;
postInset = 11; // don't ask

module inlayBracket() {
    difference() {
        union() {
            intersection() {
                roundedCube(gcWidth, gcHeight, gcDepth, gcCaseR);
                cube([gcWidth, gcHeight, gcBracketThickness]);
            };
            pegs();
        }
        translate([gcWallThickness, gcWallThickness, -0.1])
            cube([gcWidth - 2*gcWallThickness, gcHeight, gcDepth]);
        translate([gcWidth/2 - gcRearPlateWidth/2, gcHeight-gcMountingPlateSlotThickness, -1])
            rotate([90, 0, 0])
                rearPlateCutout();
        pegHoles(gcBracketThickness);
    };
    translate([0, gcHeight - 3*gcWallThickness, 0])
        cube([gcWidth, gcWallThickness, gcBracketThickness]);
    translate([0, usbBracketStickout, 0]) {
        translate([postInset, 0, 0])
            usbSupportPost();
        translate([gcWidth-postInset, 0, 0])
            usbSupportPost();
        translate([gcWidth/2, 0, 0])
            usbSupportPost();
    }
    translate([postInset-gcBracketThickness/2, 0, 0])
        cube([gcBracketThickness, gcHeight-3*gcWallThickness, gcBracketThickness]);
    translate([gcWidth-postInset-gcBracketThickness/2, 0, 0])
        cube([gcBracketThickness, gcHeight-3*gcWallThickness, gcBracketThickness]);
    translate([gcWidth/2-gcBracketThickness/2, 0, 0])
        cube([gcBracketThickness, gcHeight-3*gcWallThickness, gcBracketThickness]);
}

module usbSupportPost(l = 25) {
    j=gcBracketThickness;
    k=l-(1+sqrt(2))*gcBracketThickness;
    translate([-gcBracketThickness/2, 0, 0])
        rotate([0, 90, 0])
            linear_extrude(gcBracketThickness)
                difference() {
                    polygon(points=[
                        [l-gcBracketThickness, 0],
                        [l-gcBracketThickness, gcBracketThickness],
                        [0, l],
                        [0, 0]
                    ]);
                    polygon(points=[
                        [k, j],
                        [0, l-sqrt(2)*gcBracketThickness],
                        [0, j]
                    ]);
                };
}

inlayBracket();
