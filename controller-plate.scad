arcDepth = 5.3 / 2;
arcRadius = 120 / 2;
plateWidth = 115 / 2;
plateHeight = 59 / 2;

holeDiameter = 14.8;
holeSpacing = 13;
holeInsetY = 12.2;

$fn = 360;

difference() {
    intersection() {
        cube([plateWidth, plateHeight, arcDepth]);
        translate([0, plateWidth/4, arcDepth - arcRadius])
            rotate([0, 90, 0])
                cylinder(r = arcRadius, h = plateWidth);
    };
    translate([plateWidth/2 - (holeSpacing + holeDiameter)/2, plateHeight/2, -0.1])
        cylinder(d = holeDiameter, h = arcDepth + 0.2);
    translate([plateWidth/2 + (holeSpacing + holeDiameter)/2, plateHeight/2, -0.1])
        cylinder(d = holeDiameter, h = arcDepth + 0.2);
};
