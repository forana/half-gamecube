include <gamecube-measurements.scad>
use <common.scad>

gcFanPlateHeight = gcFrontPlateHeight;
$fn = 360;
thickness = 2;

fanWidth = 30;
fanThickness = 10.5;
fanPegLength = fanThickness + 1.5;
fanHoleDiameter = 3;
fanPegDiameter = fanHoleDiameter - 0.2;
fanHoleInset = 1.25;
pegSlotWidth = 0.8;
pegSlotDepth = 5;

cardWidth = 15;
cardHeight = 1.8;
cardDepth = 1.8;

module fanGrid() {
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
            translate([0, gcFanGridWidth/4*i - gcFanBeamWidth, 0])
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


module fanClip() {
    translate([gcFanPlateWidth/2, gcFanPlateHeight/2, -fanPegLength]) union() {
        for (i=[-1:2:1]) {
            for (j=[-1:2:1]) {
                translate([i*(fanWidth/2-fanHoleInset-fanHoleDiameter/2), j*(fanWidth/2-fanHoleInset-fanHoleDiameter/2)]) difference() {
                    union() {
                        cylinder(d=fanPegDiameter, h=fanPegLength + 1);
                        cylinder(d2=fanHoleDiameter + 0.1, d1=fanPegDiameter, h=1);
                    };
                    translate([-pegSlotWidth/2, -10, -pegSlotWidth/2])
                        roundedCube(pegSlotWidth, 20, pegSlotDepth+pegSlotWidth, pegSlotWidth/2-0.01, includeZ=true);
                }
            }
        }
    }
}

module fanPlate(pegs=false, cardGap=true) {
    if (pegs) {
        fanClip();
    }
    difference() {
        fanGrid();
        if (cardGap) {
            translate([0.4, -cardDepth, -0.1])
                cube([cardWidth, cardDepth*2, cardHeight]);
        }
    }
}

color("MediumPurple") fanPlate();