/// @description Insert description here
// You can write your code in this editor
if (instance_exists(global.hawk)) {
	if ((global.hawk.y) < y and alarm_ready(0)) {
		alarm_set(0, 8 * room_speed);
		audio_play_sound_at(warp_hit, global.hawk.x, global.hawk.y, 0, 10000, 0, 2, 0, 0);
	}
}