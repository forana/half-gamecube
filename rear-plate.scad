include <gamecube-measurements.scad>
include <pi-measurements.scad>
use <common.scad>
use <pi-mount.scad>

plateThickness = 2;

wr = 0.1;
hwr = wr/2;

humpHeight = gcRearPlateHeight - 12;

handleX = gcHandleInsetX - (gcWidth-gcRearPlateWidth)/2;
handleY = gcHandleInsetY - gcRearPlateInsetY;

module rearPlate() {
    difference() {
        union() {
            translate([-gcMountingPlateSlotWidth, 0, -gcMountingPlateSlotThickness*2])
                cube([gcRearPlateWidth + 2*gcMountingPlateSlotWidth, gcRearPlateHeight, gcMountingPlateSlotThickness]);
            translate([0, 0, -gcMountingPlateSlotThickness])
                cube([gcRearPlateWidth, gcRearPlateHeight, gcMountingPlateSlotThickness]);
            translate([0, 0, -gcCaseR]) union(){
                //roundedCube(gcRearPlateWidth, gcRearPlateHeight, gcRearPlateStickout + gcCaseR, gcCaseR, includeZ=true);
                roundedCube(gcCaseR*3, gcRearPlateHeight, gcRearPlateStickout + gcCaseR, gcCaseR, includeZ=true);
                translate([gcRearPlateWidth - gcCaseR*3, 0, 0])
                    roundedCube(gcCaseR*3, gcRearPlateHeight, gcRearPlateStickout + gcCaseR, gcCaseR, includeZ=true);
//                roundedCube(gcRearPlateWidth, gcCaseR*3, gcRearPlateStickout + gcCaseR, gcCaseR, includeZ=true);
                translate([0, gcRearPlateHeight - humpHeight, 0])
                    roundedCube(gcRearPlateWidth, humpHeight, gcRearPlateStickout + gcCaseR, gcCaseR, includeZ=true);
            }
        }
        // cutout for mount plates
        translate([gcMountingPlateSlotWidth, gcMountingPlateSlotWidth, -2.1])
            cube([gcRearPlateWidth - 2*gcMountingPlateSlotWidth, gcRearPlateHeight - 2*gcMountingPlateSlotWidth, 1.1]);
        // cutout for hump
        translate([gcMountingPlateSlotWidth, gcRearPlateHeight - humpHeight + gcCaseR, -gcCaseR-plateThickness-0.1])
            cube([gcRearPlateWidth - 2*gcMountingPlateSlotWidth, humpHeight - gcCaseR*2, gcCaseR+plateThickness+0.1]);
        // handle
        translate([handleX-hwr, handleY-hwr, 0]) {
            cube([gcHandleWidth+wr, gcHandleHeight+wr, 10]);
            translate([gcHandleDistance, 0, 0])
                cube([gcHandleWidth+wr, gcHandleHeight+wr, 10]);
        }
        // pi holes
        translate([gcRearPlateWidth, gcBaseDepth - piBoardThickness - gcRearPlateInsetY, -piBoardHeight-2])
            rotate([90, 0, 180])
                piReoriented(ww=1, wl=10);
    }
}

rearPlate();