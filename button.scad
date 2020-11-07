include <gamecube-measurements.scad>

buttonBrimHeight = 1;

$fn=64;

module button(buttonHeight = 1.5, buttonBrimWidth = 3) {
    cylinder(d = gcButtonDiameter, h = buttonHeight);
    translate([-5, -6, -buttonBrimHeight])
        cube([12, 12, buttonBrimHeight]);
}

color("LightGray") button();