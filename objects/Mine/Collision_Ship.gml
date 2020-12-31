/// @description Insert description here
// You can write your code in this editor
event_inherited();
with (other) {
	motion_add_m(point_direction(other.x, other.y, x, y), 5);
}
instance_destroy();