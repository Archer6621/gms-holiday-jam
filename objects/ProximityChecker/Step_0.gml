/// @description Insert description here
// You can write your code in this editor

with (object) {
	other.prev_dist = other.dist;
	other.prev_y_dist = other.y_dist;
	other.dist = point_distance(other.x, other.y, x, y);
	other.y_dist = abs(y - other.y);
}