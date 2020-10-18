include <gamecube-measurements.scad>
use <common.scad>


module frontPlateMemoryCutout() {
    ix = 2*gcMemorySlotDepth;
    ir = gcMemorySlotR - gcMemorySlotDepth;
    id = gcMemorySlotDepth * 2;
    difference() {
        intersection() {
            roundedCube(gcMemorySlotWidth, gcMemorySlotHeight + gcMemorySlotR, id, gcMemorySlotR);
            cube([gcMemorySlotWidth, gcMemorySlotHeight, id]);
        }
        translate([gcMemorySlotDepth, gcMemorySlotDepth, -0.1])
            intersection() {
                roundedCube(gcMemorySlotWidth - ix, gcMemorySlotHeight - ix + ir, id + 0.2, ir);
                cube([gcMemorySlotWidth - ix, gcMemorySlotHeight - ix, id + 0.2]);
            }
    }
}

module frontPlate(standoffDepth = 1) {
    $fn = 360;
    id = standoffDepth + gcMountingPlateSlotThickness;
    difference() {
        union() {
            translate([-gcMountingPlateSlotWidth, 0, 0])
                cube([gcFrontPlateWidth + 2*gcMountingPlateSlotWidth, gcFrontPlateHeight, gcMountingPlateSlotThickness]);
            cube([gcFrontPlateWidth, gcFrontPlateHeight, id]);
            translate([0, 0, id])
                intersection() {
                    cube([gcFrontPlateWidth, gcFrontPlateHeight, gcFrontPlateArcDepth]);
                    translate([0, gcFrontPlateWidth/4, gcFrontPlateArcDepth - gcFrontPlateArcRadius])
                        rotate([0, 90, 0])
                            cylinder(r = gcFrontPlateArcRadius, h = gcFrontPlateWidth);
                };
        }
        // underslot (?)
        translate([gcMountingPlateSlotWidth, gcMountingPlateSlotWidth, -0.1])
            cube([gcFrontPlateWidth - 2*gcMountingPlateSlotWidth, gcFrontPlateHeight - 2*gcMountingPlateSlotWidth, id + 0.1]);
        // holes
        translate([gcFrontPlateWidth/2 - (gcFrontPlateHoleSpacing + gcFrontPlateHoleDiameter)/2, gcFrontPlateHeight/8*5, -0.1])
            cylinder(d = gcFrontPlateHoleDiameter, h = gcFrontPlateArcDepth + id + 0.2);
        translate([gcFrontPlateWidth/2 + (gcFrontPlateHoleSpacing + gcFrontPlateHoleDiameter)/2, gcFrontPlateHeight/8*5, -0.1])
            cylinder(d = gcFrontPlateHoleDiameter, h = gcFrontPlateArcDepth + id + 0.2);
        // memory card
        translate([gcFrontPlateWidth/2 - gcMemorySlotWidth/2, gcFrontPlateHeight/20, gcFrontPlateArcDepth + id - gcMemorySlotDepth*2])
            frontPlateMemoryCutout();
    };
};

color("LightGray") frontPlate();
//frontPlateMemoryCutout();
