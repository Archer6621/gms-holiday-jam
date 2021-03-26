/// @description Insert description here
// You can write your code in this editor
if (not array_contains(blacklist, other.id)) {
	with (other) {
		integrity -= 0.1 / game_get_speed(gamespeed_fps);
	}
}