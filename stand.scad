include <measurements.scad>;

baseThickness = 1;
baseFrameWidth = piScrewHoleInset * 2;

module standPost(x, y) {
    $fn = 32;
    translate([x, y, 0]) union() {
        cylinder(d = piScrewHoleSafeDiameter, h = piSafeBelow);
        cylinder(d = piScrewHoleDiameter, h = piSafeBelow + 3* piBoardThickness);
    }
}



module piStand() {
    translate([0, 0, -baseThickness]) difference() {
        cube([piBoardWidth, piBoardHeight, baseThickness]);
        translate([baseFrameWidth, baseFrameWidth, -0.1])
            cube([piBoardWidth - 2*baseFrameWidth, piBoardHeight - 2*baseFrameWidth, 2*baseThickness]);
    }
    standPost(piScrewHoleInset, piScrewHoleInset);
    standPost(piBoardWidth-piScrewHoleInset, piScrewHoleInset);
    standPost(piBoardWidth-piScrewHoleInset, piBoardHeight-piScrewHoleInset);
    standPost(piScrewHoleInset, piBoardHeight-piScrewHoleInset);
}

!color("Gray") piStand();
//translate([0, 0, baseThickness + piSafeBelow]) piModel3APlus();