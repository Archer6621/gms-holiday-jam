/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_angle = 45 + array_choose(range(0, 4, 90));

image_xscale = 2;
image_yscale = image_xscale;
density = 10;
interval = 1.0;
var ds = global.game_manager.difficulty_scaling
warn_interval = 0.25 / ds;

hole_x = lengthdir_x(sprite_width * 0.4, image_angle);
hole_y = lengthdir_y(sprite_width * 0.4, image_angle);

alarm_set(0, ceil(random(0.25 * interval * room_speed)));

// Lighting
normal_strength_scale = 0.5;
ambient_scale = 0.75;
lighting_intensity_scale = 1.4;
emission_strength_scale = 2.0;