/// @description Insert description here
// You can write your code in this editor
if (not array_contains(blacklist, other.id)) {
	with (other) {
		d_motion_add_m(other.image_angle, other.push_force);
	}
}