include <gamecube-measurements.scad>
include <pi-measurements.scad>
use <gamecube-base.scad>
use <controller-plate.scad>
use <fan-plate.scad>
use <pi-mount.scad>
use <rear-plate.scad>
use <handle.scad>
use <inlay-bracket.scad>
use <usb-bracket.scad>
use <top.scad>
use <top-disk.scad>
use <button.scad>

color("MediumPurple") gamecubeBase();
translate([0, 0, gcBaseDepth]) {
    translate([gcWidth/2 - gcFrontPlateWidth/2, 2, 0])
        rotate([90, 0, 0])
            color("LightGray") frontPlate();
    translate([2, gcHeight/2 + gcFanPlateWidth/2, 0])
        rotate([90, 0, -90])
            color("MediumPurple") fanPlate();
    translate([gcWidth-2, gcHeight/2 - gcFanPlateWidth/2, 0])
        rotate([90, 0, 90])
            color("MediumPurple") fanPlate(cardGap=false);
}
translate([gcWallThickness + 0.05, gcWallThickness + 0.05, gcBaseThickness]) {
    color("MediumPurple") piMount();
}
translate([gcWallThickness + 0.05, gcHeight - piBoardHeight - 2, gcBaseDepth-piBoardThickness])
        piReoriented();
translate([gcWidth-gcWallThickness, gcHeight, gcRearPlateInsetY])
    rotate([90, 0, 180])
        color("MediumPurple") rearPlate();
translate([gcWidth/2, gcHeight + 2, gcHandleInsetY])
    color("#333") handle();

translate([gcWidth/2 - gcFrontPlateInsetWidth/2, 2, gcBaseDepth + gcMountingPlateSlotWidth + 0.05])
    rotate([90, 0, 0])
        color("#333") usbBracket();

translate([0, 0, gcBaseDepth + gcFrontPlateHeight + 0.1])
    color("MediumPurple") inlayBracket();

translate([0, 0, gcBaseDepth + gcFrontPlateHeight + gcBracketThickness + 0.1])
    color("MediumPurple") top();
translate([gcWidth/2, gcHeight/2, gcDepth - 1.5])
    color("#333") topDisk();
translate([gcPowerButtonX, gcPowerButtonY, gcDepth - 1.6])
    color("LightGray") button();
    
