/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (not behaviour_disabled) {
	with (other) {
		motion_add_m(point_direction(other.x, other.y, x, y), 12);
	}
	instance_destroy();
}