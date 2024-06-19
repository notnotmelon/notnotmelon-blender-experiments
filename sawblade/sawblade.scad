$fa = 3;
$fs = 0.01;
$vpr = [0, 0, 0];
$vpt = [5, 0, 5];

inner = false;

num_spikes = 30;

module base() {
    union() {
        cylinder(0.1, r = 1, center = true);

        for (i = [1:num_spikes]) {
            rotate([0, 0, 360/num_spikes*i]) {
                translate([0, 1, 0]) {
                    linear_extrude(height = 0.1, center = true) {
                        polygon(points = [[-0.2, 0], [0.2, 0.2], [0, -1]]);
                    }
                }
            }
        }
    }
}

rotate([20, 60, 0])
if (inner) {
    intersection() {
        cylinder(1, r = 1, center = true);
        difference() {
            base();
            cylinder(1, r = 0.4, center = true);
        }
    }
} else {
    intersection() {
        cylinder(1, r = 10, center = true);
        difference() {
            base();
            cylinder(1, r = 1, center = true);
        }
    }
}