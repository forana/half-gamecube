include <gamecube-measurements.scad>
use <common.scad>

gcTopDepth = gcDepth - gcBaseDepth - gcFrontPlateHeight;
cutoutDepth = 0.5;

module gcTop() {
    difference() {
        translate([0, 0, -gcCaseR])
            roundedCube(gcWidth, gcHeight, gcTopDepth + gcCaseR, gcCaseR, includeZ=true);
        translate([0, 0, gcTopDepth-cutoutDepth])
            scale([0.5, 0.5, 0.5])
                linear_extrude(3)
                    import("top.svg");
    }
}

gcTop();