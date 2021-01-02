/// @description Insert description here
// You can write your code in this editor
if (collision_map[? other.id] == undefined) {
	event_perform(ev_collision, Rigidbody);
	with (other) {
		var dist = point_distance(x, y, other.x, other.y);
		var time = 1 - image_index / image_number;
		//print(power(1 / dist, 0.5), power(time, 2))
		knock_out((0.2 + 2 * power(1 / max(1, dist), 0.25)) * power(other.image_xscale, 0.5) *  power(time, 3));	
	}
}