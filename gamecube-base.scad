include <gamecube-measurements.scad>
use <common.scad>

baseHeight = gcBaseDepth + gcFrontPlateHeight;
wr = 0.1; // wiggle room
hwr = wr/2;

module shell() {
    difference() {
        intersection() {
            roundedCube(gcWidth, gcHeight, gcDepth, gcCaseR, includeZ = true);
            cube([gcWidth, gcHeight, baseHeight + wr]);
        };
        translate([gcWallThickness, gcWallThickness, gcBaseThickness])
            cube([gcWidth - 2*gcWallThickness, gcHeight - 2*gcWallThickness, gcDepth]);
    };
}

module frontPlateCutout() {
    translate([-hwr, 0, -hwr]) union() {
        translate([-gcMountingPlateSlotWidth, 0, 0])
            cube([gcFrontPlateWidth + gcMountingPlateSlotWidth*2 + wr, baseHeight, gcMountingPlateSlotThickness + wr]);
        translate([0, 0, -gcWallThickness])
            cube([gcFrontPlateWidth + wr, baseHeight, 2*gcWallThickness]);
    }
}

module fanPlateCutout() {
    translate([-hwr, 0, -hwr]) union() {
        translate([-gcMountingPlateSlotWidth, 0, 0])
            cube([gcFanPlateWidth + gcMountingPlateSlotWidth*2 + wr, baseHeight, gcMountingPlateSlotThickness + wr]);
        translate([0, 0, -gcWallThickness])
            cube([gcFanPlateWidth + wr, baseHeight, 2*gcWallThickness]);
    }
}

module rearPlateCutout() {
    translate([-hwr, 0, -hwr]) union() {
        translate([-gcMountingPlateSlotWidth, 0, 0])
            cube([gcRearPlateWidth + gcMountingPlateSlotWidth*2 + wr, gcRearPlateHeight, gcMountingPlateSlotThickness + wr]);
        translate([0, 0, -gcWallThickness])
            cube([gcRearPlateWidth + wr, gcRearPlateHeight, 2*gcWallThickness]);
    }
}

module pegHole() {
    $fn=64;
    translate([0, 0, -gcMountingPegHeight-hwr])
        cylinder(d=gcMountingPegDiameter +wr, h = gcMountingPegHeight*2 + wr);
}

module gamecubeBase() {
    difference() {
        shell();
        // front
        translate([gcWidth/2 - gcFrontPlateWidth/2, gcMountingPlateSlotThickness * 2, gcBaseDepth])
            rotate([90, 0, 0])
                frontPlateCutout();
        // fans
        translate([gcMountingPlateSlotThickness, gcHeight/2-gcFanPlateWidth/2, gcBaseDepth])
            rotate([0, 0, 90])
                rotate([90, 0, 0])
                    fanPlateCutout();
        translate([gcWidth - gcMountingPlateSlotThickness, gcHeight/2-gcFanPlateWidth/2, gcBaseDepth])
            mirror([1, 0, 0])
                rotate([0, 0, 90])
                    rotate([90, 0, 0])
                        fanPlateCutout();
        // rear
        translate([gcWidth/2 - gcRearPlateWidth/2, gcHeight-gcMountingPlateSlotThickness, gcRearPlateInsetY])
            rotate([90, 0, 0])
                rearPlateCutout();
        // peg holes
        translate([gcWallThickness/2, gcWallThickness/2, baseHeight])
            pegHole();
        translate([gcWallThickness/2, gcHeight/5 - gcWallThickness/2, baseHeight])
            pegHole();
        translate([gcWallThickness/2, gcHeight/5*4 - gcWallThickness/2, baseHeight])
            pegHole();
        translate([gcWallThickness/2, gcHeight - gcWallThickness/2*3, baseHeight])
            pegHole();
        translate([gcWidth - gcWallThickness/2, gcWallThickness/2, baseHeight])
            pegHole();
        translate([gcWidth - gcWallThickness/2, gcHeight/5 - gcWallThickness/2, baseHeight])
            pegHole();
        translate([gcWidth - gcWallThickness/2, gcHeight/5*4 - gcWallThickness/2, baseHeight])
            pegHole();
        translate([gcWidth - gcWallThickness/2, gcHeight - gcWallThickness/2*3, baseHeight])
            pegHole();
    }
}

color("MediumPurple") gamecubeBase();
