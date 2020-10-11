postSideShort = 2.1;
postSideLong = 3.1;
postDepth = 3;

buttonLid = 1;
buttonDiameter = 16.5/2;
buttonBrimHeight = 1;
buttonBrimWidth = 1.5;

$fn=64;

color("LightGray") difference() {
    union() {
        cylinder(d = buttonDiameter, h = buttonLid + postDepth);
        cylinder(d = buttonDiameter + buttonBrimWidth, h = buttonBrimHeight);
    }
    translate([-postSideShort/2, -postSideLong/2, -0.1])
        cube([postSideShort, postSideLong, postDepth + 0.1]);
}