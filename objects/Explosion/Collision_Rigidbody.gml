/// @description Insert description here
// You can write your code in this editor

if (collision_map[? other.id] == undefined) {
	with (other) {
		var dist = max(1, point_distance(other.x, other.y, x, y));
		motion_add_m(point_direction(other.x, other.y, x, y), other.image_yscale * other.image_xscale *  power(1 / dist, 0.5));
	}
	collision_map[? other.id] = true;
}