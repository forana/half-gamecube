include <gamecube-measurements.scad>

wr = 0.1;
hwr = wr/2;

usbPortThickness = 5.9;
usbPortWidth = 13.5;
usbLip = 0.8;

bracketDepth = 5.7;

frontPlateInsetWidth = gcFrontPlateInsetWidth - wr;
frontPlateInsetHeight = gcFrontPlateInsetHeight - wr;

channelWidth = 4;
channelDepth = bracketDepth - 2;

usbSlotY = frontPlateInsetHeight/8*5;

pegWidth = 2;
pegDepth = 3;

module usbPort() {
    translate([-usbPortWidth/2 - usbLip, -usbPortThickness/2 - usbLip, 0]) union() {
        translate([usbLip, usbLip, -0.1])
            cube([usbPortWidth, usbPortThickness, bracketDepth + 0.2]);
        translate([0, 0, bracketDepth - usbLip])
            cube([usbPortWidth + 2*usbLip, usbPortThickness + 2*usbLip, usbLip * 2]);
    }
}

module usbBracketBottom() {
    difference() {
        union() {
            cube([frontPlateInsetWidth, usbSlotY, bracketDepth]);
            translate([(channelWidth-pegWidth)/2+hwr, usbSlotY, (bracketDepth-pegWidth)/2+hwr])
                cube([pegWidth-wr, pegDepth-wr, pegWidth-wr]);
            translate([frontPlateInsetWidth-(channelWidth-pegWidth)/2-pegWidth+hwr, usbSlotY, (bracketDepth-pegWidth)/2+hwr])
                cube([pegWidth-wr, pegDepth-wr, pegWidth-wr]);
            translate([frontPlateInsetWidth/2-(channelWidth-pegWidth)/2+hwr, usbSlotY, (bracketDepth-pegWidth)/2+hwr])
                cube([pegWidth-wr, pegDepth-wr, pegWidth-wr]);
        }
        translate([frontPlateInsetWidth/2 - (gcFrontPlateHoleSpacing + gcFrontPlateHoleDiameter)/2, usbSlotY, -0.1])
            usbPort();
        translate([frontPlateInsetWidth/2 + (gcFrontPlateHoleSpacing + gcFrontPlateHoleDiameter)/2, usbSlotY, -0.1])
            usbPort();
    }
}

module usbBracketTop() {
    difference() {
        cube([frontPlateInsetWidth, frontPlateInsetHeight - usbSlotY, bracketDepth]);
        translate([(channelWidth-pegWidth)/2-hwr, -0.1, (bracketDepth-pegWidth)/2+hwr])
            cube([pegWidth+wr, pegDepth+wr, pegWidth+wr]);
        translate([frontPlateInsetWidth-(channelWidth-pegWidth)/2-pegWidth-hwr, -0.1, (bracketDepth-pegWidth)/2+hwr])
            cube([pegWidth+wr, pegDepth+wr, pegWidth+wr]);
        translate([frontPlateInsetWidth/2-(channelWidth-pegWidth)/2-hwr, -0.1, (bracketDepth-pegWidth)/2+hwr])
            cube([pegWidth+wr, pegDepth+wr, pegWidth+wr]);
        translate([frontPlateInsetWidth/2 - (gcFrontPlateHoleSpacing + gcFrontPlateHoleDiameter)/2, 0, -0.1])
            usbPort();
        translate([frontPlateInsetWidth/2 + (gcFrontPlateHoleSpacing + gcFrontPlateHoleDiameter)/2, 0, -0.1])
            usbPort();
    }
}

module usbBracket() {
    translate([0, 0, -bracketDepth]) {
        usbBracketBottom();
        translate([0, usbSlotY, 0])
            usbBracketTop();
    }
}


usbBracketBottom();
translate([0, usbSlotY + 2*pegDepth, 0])
    usbBracketTop();