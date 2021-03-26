/// @description Insert description here
// You can write your code in this editor
if (has_dialogue() and all_done() and alarm_ready(0)) {
	d_alarm_set(0, game_get_speed(gamespeed_fps) * 4);
}