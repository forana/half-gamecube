include <gamecube-measurements.scad>

pegLipWidth = 0.5;
pegLipDepth = 2;
pegShaft = 2.2;
pegDepth = pegShaft + pegLipDepth;
pegSlotWidth = 1;
pegSlotDepth = 3;

handleInset = sqrt(pow(gcHandleRadius-(gcHandleWidth/2), 2) - pow(gcHandleDistance/2, 2));

module handlePeg() {
    translate([-gcHandleWidth/2, -pegDepth, 0]) difference() {
        union() {
            cube([gcHandleWidth, pegDepth, gcHandleHeight]);
            linear_extrude(gcHandleHeight, center=false)
                polygon(points=[
                    [0, 0],
                    [-pegLipWidth, pegLipDepth],
                    [gcHandleWidth + pegLipWidth, pegLipDepth],
                    [gcHandleWidth, 0]
                ]);
        }
        translate([(gcHandleWidth-pegSlotWidth)/2, -0.1, -0.1])
            cube([pegSlotWidth, pegSlotDepth+0.1, gcHandleHeight + 0.2]);
    }
}

module handle() {
    $fn=360;
    translate([0, -handleInset, 0]) difference() {
        cylinder(r = gcHandleRadius, h = gcHandleHeight);
        translate([0, 0, -0.1])
            cylinder(r = gcHandleRadius - gcHandleWidth, h = gcHandleHeight + 0.2);
        translate([-gcHandleRadius-0.1, -gcHandleRadius-0.1, -0.1])
            cube([gcHandleRadius*2+0.2, gcHandleRadius+handleInset+0.1, gcHandleHeight + 0.2]);
    }
    translate([gcHandleDistance/2, 0, 0]) handlePeg();
    translate([-gcHandleDistance/2, 0, 0]) handlePeg();
}

color("#rrggbb") handle();
