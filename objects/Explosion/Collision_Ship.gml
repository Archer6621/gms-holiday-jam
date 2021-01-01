/// @description Insert description here
// You can write your code in this editor
if (collision_map[? other.id] == undefined) {
	event_perform(ev_collision, Rigidbody);
	with (other) {
		knock_out(ceil(0.5 * clamp(1.4 -  1.4 * image_index / image_number, 0, 1) * other.image_xscale));	
	}
}