/// @description Insert description here
// You can write your code in this editor

if (collision_map[? other.id] == undefined) {
	with (other) {
		motion_add_m(point_direction(other.x, other.y, x, y), 0.1 * other.image_xscale);
	}
	collision_map[? other.id] = true;
}