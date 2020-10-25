include <gamecube-measurements.scad>
include <pi-measurements.scad>
use <gamecube-base.scad>
use <controller-plate.scad>
use <fan-plate.scad>
use <pi-mount.scad>
use <rear-plate.scad>
use <handle.scad>

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
    color("Black") handle();
