include <gamecube-measurements.scad>
include <pi-measurements.scad>
use <gamecube-base.scad>
use <controller-plate.scad>
use <fan-plate.scad>
use <pi-mount.scad>

color("MediumPurple") gamecubeBase();
translate([0, 0, gcBaseDepth]) {
    translate([gcWidth/2 - gcFrontPlateWidth/2, 2, 0])
        rotate([90, 0, 0])
            color("LightGray") frontPlate();
    translate([2, gcHeight/2 + gcFanPlateWidth/2, 0])
        rotate([90, 0, -90])
            color("MediumPurple") fanPlate(pegs=false);
    translate([gcWidth-2, gcHeight/2 - gcFanPlateWidth/2, 0])
        rotate([90, 0, 90])
            color("MediumPurple") fanPlate(pegs=false);
}
translate([gcWallThickness + 0.05, gcWallThickness + 0.05, gcBaseThickness]) {
    color("MediumPurple") piMount();
    translate([piBoardWidth + piUSBStickout + 0.1, gcHeight - 2*gcWallThickness, gcBaseDepth-gcBaseThickness])
        rotate([0, 0, 180])
            piModel3APlus();
}