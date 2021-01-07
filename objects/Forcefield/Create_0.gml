/// @description Insert description here
// You can write your code in this editor

base_a = instance_create(ForceFieldBase);
base_b = instance_create(ForceFieldBase);

orientation = choose(90, 0, 45, 135);
distance = 100 + random(200);
image_xscale = 4 * distance / sprite_get_width(sprite_index);
image_yscale = 4 * distance / sprite_get_height(sprite_index);
image_alpha = 0;
force = 10;
beam_width = 10;

depth = 1;
base_a.x = x;
base_a.y = y;
base_b.x = x;
base_b.y = y;

base_a.x += lengthdir_x(distance, orientation);
base_a.y += lengthdir_y(distance, orientation);

base_b.x += lengthdir_x(distance, 180 + orientation);
base_b.y += lengthdir_y(distance, 180 + orientation);