/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
var ds = global.game_manager.difficulty_scaling;
if (instance_exists(global.hawk) and not behaviour_disabled) {
	randomize();
	if (deviation > -10 and deviation < 10 and random(1) > (0.997 - 0.004 * ds)) {
		create_projectile(x, y, SmallBeam);
		audio_play_sound_at(small_beam_shot, x, y, 0, 1000, 0, 2, 0, 0);
	}
}