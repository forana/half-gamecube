include <gamecube-measurements.scad>
use <gamecube-base.scad>
use <controller-plate.scad>
use <fan-plate.scad>

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
            color("MediumPurple") fanPlate(pegs=true);
}