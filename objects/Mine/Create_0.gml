/// @description Insert description here
// You can write your code in this editor
event_inherited();

// inits
image_angle = random(360);

// params
creator = noone;
guide_distance = 500;
max_speed = 4;
acceleration_rate = 10;

// Lighting
create_following_light(id, c_red, 30, 1.0);
lighting_intensity_scale = 0.25;
ambient_scale = 0.1;
emission_strength_scale = 1.5;
