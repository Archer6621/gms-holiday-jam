/// @description Insert description here
// You can write your code in this editor


if (not array_contains(blacklist, other.id)) {
	event_perform(ev_collision, Rigidbody);
	with (other) {
		alarm_set(0, 0.5 * room_speed);
	}
	blacklist = array_append(blacklist, other.id);
}