/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (not behaviour_disabled) {
	var charge = 3 * max(0, (warn_interval * interval * game_get_speed(gamespeed_fps) - d_alarm_get_safe(0)) /  (interval * game_get_speed(gamespeed_fps))) / warn_interval;
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(spr_charge, 0, x + 1.65 * hole_x, y + 1.65 * hole_y, charge, charge, global.frames, c_white, 0.5);
	draw_sprite_ext(spr_charge, 0, x + 1.65 * hole_x, y + 1.65 * hole_y, 0.8 * charge, 0.8 * charge, -global.frames, c_white, 0.5);
	gpu_set_blendmode(bm_normal);
}