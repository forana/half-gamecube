include <gamecube-measurements.scad>

diskThickness = 1.5;
plateThickness = diskThickness / 2;
plateWidth = 5;

module topDisk() {
    $fn = 360;
    cylinder(d = gcInlayDiameter, h = diskThickness);
    cylinder(d = gcInlayDiameter + plateWidth*2, h = plateThickness);
}

topDisk();
