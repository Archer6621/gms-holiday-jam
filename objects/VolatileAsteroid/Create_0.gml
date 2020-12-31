/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();



fuse_proximity = 300;
growth = 1 + random(3);
fuse_time = growth / 3;

//image_blend = merge_colour(c_gray, c_white, 0.3);
create_following_light(id, c_orange, image_xscale * 40, 0.5);
normal_strength_scale = 0.25;
emission_strength_scale = 1.0;
//lighting_intensity_scale = 1.0;
ambient_scale = 0.5;