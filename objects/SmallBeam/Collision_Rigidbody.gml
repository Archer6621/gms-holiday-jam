/// @description Insert description here
// You can write your code in this editor

if (not array_contains(blacklist, other.id)) {
	with (other) {
		var ds = global.game_manager.difficulty_scaling;
		d_motion_add_m(other.image_angle, power(ds, 0.75) * 2);
	}
	blacklist = array_append(blacklist, other.id);
}