/// @description Insert description here
// You can write your code in this editor

event_perform(ev_collision, Rigidbody);
with (other) {
	knock_out(ceil(0.3 * other.image_xscale));	
}