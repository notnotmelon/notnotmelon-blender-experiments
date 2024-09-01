$fa = 0.2; // Set the angle precision
$fs = 0.5;
    $fn = 10;

module arc(radius, angle, height) {
    render()
    rotate([0, 90, 0])
    linear_extrude(height = height, center = true)
        difference() {
            circle(radius);
            circle(radius - 1.5);
        }
}

module glass_dome(radius, height, num_rotations) {
    rotate(360/2/num_rotations)
    for (i = [0:num_rotations-1]) {
        rotate(i * 360 / num_rotations)
            scale([1, 1, height/radius])
                arc(radius, 45, 1);
    }
}

module glass(radius, height, num_rotations) {
    hull()
    rotate(360/2/num_rotations)
    for (i = [0:num_rotations-1]) {
        rotate(i * 360 / num_rotations)
            scale([1, 1, height/radius])
                arc(radius, 45, 1);
    }
}

module base_octagon(radius) {
    $fn = 8;
    linear_extrude(height = 0.6, center = false)
    rotate(360/2/8)
    difference() {
        circle(radius-1.2);
        circle(radius-2.5);
    }
}

radius = 30;
height = 15;
num_rotations = 8;
scale([1/sqrt(2), 1, 1])
difference() {
    union() {
        *glass(radius-1, height-0.5, num_rotations);
        glass_dome(radius, height, num_rotations);
        base_octagon(radius);
    }
    translate([0, 0, -height+height*0.15])
        cube([2*radius, 2*radius, height*1.7], center = true);
}

    
            