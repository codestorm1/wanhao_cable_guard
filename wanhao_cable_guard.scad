nub_length = 15;
wall_thickness = 2;
top_thickness = 1;
metal_thickness = 1;
gap = 1.5;
metal_gap = metal_thickness + gap;
width = 7;
lip_thickness = 1.5;
top_lip_length = wall_thickness + 1;
bot_lip_length = wall_thickness + 1.5;
wall_height = 55;
trap_width = 15;


module lip_wrap(lip_length) {
  union() {
    cube([width, metal_gap + wall_thickness, top_thickness]);

    translate([0, metal_gap + wall_thickness, 0])
      cube([width, lip_thickness, lip_length]);
  }
}

translate([wall_height / 2, 7.5, 0])
rotate([0, -90, 0]) {
  union() {
    cube([width, wall_thickness, wall_height]);

    translate([0, 0 - nub_length, wall_height - width])
      cube([width, nub_length, width]);

    lip_wrap(bot_lip_length);

    translate([width, 0, wall_height])
      rotate([180, 0, 180])
        lip_wrap(top_lip_length);

    translate([0, - nub_length, wall_height - width])
      cube([trap_width, 4, width]);
  }
}
