/// @description Insert description here
// You can write your code in this editor


if (not alarm_ready(0) and alarm_ready(1)) {
	image_alpha = 1 - d_alarm_get(0) / (game_get_speed(gamespeed_fps) * transition_speed_out);
	global.ui_lock = true;
}
if (not alarm_ready(1) and alarm_ready(0)) {
	image_alpha = d_alarm_get(1) / (game_get_speed(gamespeed_fps) * transition_speed_in);
	global.ui_lock = false;
}
if (alarm_ready(0) and alarm_ready(1)) {
	image_alpha = 0;
	global.ui_lock = false;
}

