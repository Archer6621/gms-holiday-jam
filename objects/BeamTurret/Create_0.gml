/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_angle = 45 + array_choose(range(0, 4, 90));

image_xscale = 2;
image_yscale = image_xscale;
density = 10;
p_friction = 5;
interval = 2;
warn_interval = 0.25;

hole_x = lengthdir_x(sprite_width * 0.4, image_angle);
hole_y = lengthdir_y(sprite_width * 0.4, image_angle);

alarm_set(1, random(interval * room_speed));