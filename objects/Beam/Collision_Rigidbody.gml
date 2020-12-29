/// @description Insert description here
// You can write your code in this editor

if (not array_contains(blacklist, other.id)) {
	with (other) {
		// Is an impulse
		motion_add(other.image_angle, 20);
	}
	blacklist = array_append(blacklist, other.id);
}