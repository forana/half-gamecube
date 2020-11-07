include <gamecube-measurements.scad>
use <gamecube-base.scad>
use <common.scad>

gcTopDepth = gcDepth - gcBaseDepth - gcFrontPlateHeight - gcBracketThickness;
cutoutDepth = 0.5;
buttonSpace = 1;
topThickness = 1.5;

module buttonCutout() {
    $fn = 64;
    translate([0, 0, -0.1])
        cylinder(d = gcButtonDiameter + buttonSpace, h = gcTopDepth + 0.2);
}

module buttonIndent() {
    $fn = 64;
    translate([0, 0, gcTopDepth - cutoutDepth])
        difference() {
            cylinder(d = gcButtonDiameter + buttonSpace, h = gcTopDepth);
            cylinder(d = gcButtonDiameter, h = gcTopDepth);
        };
}

module top() {
    difference() {
        translate([0, 0, -gcCaseR])
            roundedCube(gcWidth, gcHeight, gcTopDepth + gcCaseR, gcCaseR, includeZ=true);
        translate([0, 0, gcTopDepth-cutoutDepth])
            scale([0.5, 0.5, 0.5])
                linear_extrude(3) union() {
                    import("top-outline.svg");
                    import("top-led.svg");
                }
        translate([-1, -1, -gcTopDepth])
            cube([gcWidth*2, gcHeight*2, gcTopDepth]);
        // buttons;
        translate([gcPowerButtonX, gcPowerButtonY, 0])
            buttonCutout();
        translate([gcResetButtonX, gcResetButtonY, 0])
            buttonIndent();
        translate([gcOpenButtonX, gcOpenButtonY, 0])
            buttonIndent();
        // interior
        translate([gcWallThickness, gcWallThickness, -0.1])
            cube([gcWidth - 2*gcWallThickness, gcHeight - 2*gcWallThickness, gcTopDepth - topThickness - 0.1]);
        // inlay bracket
        $fn = 360;
        translate([gcWidth/2, gcHeight/2, 0]) {
            cylinder(d = gcInlayDiameter + 0.5, h = gcTopDepth * 2);
            cylinder(d = gcInlayDiameter + 20, h = gcTopDepth - topThickness / 2);
        }
        // rear plate
        translate([gcWidth/2 - gcRearPlateWidth/2, gcHeight-gcMountingPlateSlotThickness, gcRearPlateInsetY+gcTopDepth-gcDepth+0.1])
            rotate([90, 0, 0])
                rearPlateCutout();
    }
    pegs();
}

top();