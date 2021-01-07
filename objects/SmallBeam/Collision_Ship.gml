/// @description Insert description here
// You can write your code in this editor


if (not array_contains(blacklist, other.id)) {
	event_perform(ev_collision, Rigidbody);
	with (other) {
		knock_out(0.25);
	}
	blacklist = array_append(blacklist, other.id);
}