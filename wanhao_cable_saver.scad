nub_length = 15;
wall_thickness = 2;
metal_thickness = 1;
gap = 0.1;
metal_gap = metal_thickness + gap;
width = 7;
lip_length = 2;
wall_height = 51;
trap_width = 20;
trap_thickness = 5;

module lip_wrap() {
  union() {
    cube([width, metal_gap + wall_thickness, wall_thickness]);

    translate([0, metal_gap + wall_thickness, 0])
      cube([width, lip_length, wall_thickness * 2]);
  }
}

rotate([0, -90, 0]) {
  union() {
    cube([width, wall_thickness, wall_height]);

    translate([0, 0 - nub_length, wall_height - width])
      cube([width, nub_length, width]);

    lip_wrap();

    translate([width, 0, wall_height])
      rotate([180, 0, 180])
        lip_wrap();

    translate([0, - nub_length, wall_height - width])
      cube([trap_width, 4, width]);
  }
}
