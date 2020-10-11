piBoardWidth = 65;
piBoardHeight = 56;
piBoardThickness = 1.5;
piScrewHoleDiameter = 2.7;
piScrewHoleSafeDiameter = 5.5;
piScrewHoleInset = 3.5;
piSafeBelow = 3;

// starting from the corner closest to power
piAudioInset = 50;
piAudioWidth = 7.3;
piAudioHeight = 6;
piAudioStickout = 2.54; // suspicious
piAudioStickin = 12.2;

piHDMIInset = 24.5;
piHDMIWidth = 15;
piHDMIHeight = 6.5;
piHDMIStickout = 1.4;
piHDMIStickin = 10;

piPowerInset = 6.8;
piPowerWidth = 8;
piPowerHeight = 3.1;
piPowerStickout = 1.3;
piPowerStickin = 4;

piSDInset = 21.8;
piSDWidth = 12.1;
piSDHeight = 1.3;
piSDStickout = 2.5;
piSDStickin = 13;

// starting from corner closest to audio
piUSBInset = 23.5;
piUSBWidth = 15;
piUSBHeight = 7.8;
piUSBStickout = 2.1;
piUSBStickin = 12;

module piModel3APlus(slotEnlargement = 0) {
    color("LightGreen")
        cube([piBoardWidth, piBoardHeight, piBoardThickness]);
    color("Silver") union() {
        translate([0, 0, piBoardThickness]) {
            translate([piPowerInset, -piPowerStickout, 0])
                cube([piPowerWidth, piPowerStickin+piPowerStickout, piPowerHeight]);
            translate([piHDMIInset, -piHDMIStickout, 0])
                cube([piHDMIWidth, piHDMIStickin+piHDMIStickout, piHDMIHeight]);
            translate([piAudioInset, -piAudioStickout, 0])
                cube([piAudioWidth, piAudioStickin+piAudioStickout, piAudioHeight]);
            translate([piBoardWidth-piUSBStickin, piUSBInset, 0])
                cube([piUSBStickin + piUSBStickout, piUSBWidth, piUSBHeight]);
        }
        translate([-piSDStickout, piSDInset, -piSDHeight])
            cube([piSDStickin+piSDStickout, piSDWidth, piSDHeight]);
    }
}

//piModel3APlus();