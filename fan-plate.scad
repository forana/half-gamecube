include <gamecube-measurements.scad>

gcFanPlateHeight = gcFrontPlateHeight;
$fn = 360;
thickness = 2;

module fanPlate() {
    // mounting plate
    // frame
    difference() {
        union() {
            translate([-gcMountingPlateSlotWidth, 0, 0])
                cube([gcFanPlateWidth + 2*gcMountingPlateSlotWidth, gcFanPlateHeight, gcMountingPlateSlotThickness]);
            cube([gcFanPlateWidth, gcFanPlateHeight, thickness]);
        }
        translate([gcFanPlateWidth/2 - gcFanGridWidth/2, gcFanPlateHeight - gcFanGridWidth, -0.1])
            cube([gcFanGridWidth, gcFanGridWidth - gcFanBeamWidth, thickness + 0.2]);
    }
    // beams
    translate([gcFanPlateWidth/2 - gcFanGridWidth/2, gcFanPlateHeight - gcFanGridWidth, 0]) union() {
        for (i=[1:3]) {
            translate([gcFanGridWidth/4*i - gcFanBeamWidth/2, 0, 0])
                cube([gcFanBeamWidth, gcFanGridWidth, thickness]);
            translate([0, gcFanGridWidth/4*i - gcFanBeamWidth/2, 0])
                cube([gcFanGridWidth, gcFanBeamWidth, thickness]);
        }
    }
    // nub
    translate([0, 0, thickness])
        intersection() {
            cube([gcFanPlateWidth, gcFanNubThickness, gcFanNubArcHeight]);
            translate([gcFanPlateWidth/2, 0, gcFanNubArcHeight - gcFanNubArcRadius])
                rotate([-90, 0, 0])
                    cylinder(r = gcFanNubArcRadius, h = gcFanNubThickness);
        }
}

color("MediumPurple") fanPlate();