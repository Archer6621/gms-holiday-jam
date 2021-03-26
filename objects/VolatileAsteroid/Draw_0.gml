/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (not alarm_ready(0)) {
	image_xscale += growth / (fuse_time * game_get_speed(gamespeed_fps));
	image_yscale = image_xscale;
	var timer = d_alarm_get(0) / (fuse_time * game_get_speed(gamespeed_fps));
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, 0, x, y, 1.1*image_xscale, 1.1*image_yscale, image_angle, c_red, 0.2 + 1.0 - timer); 
	gpu_set_blendmode(bm_normal);
}