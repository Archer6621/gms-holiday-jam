/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(global.hawk)) {
	if (alarm_ready(0) and point_distance(x, y, global.hawk.x, global.hawk.y) < fuse_proximity) {
		alarm_set(0, fuse_time * room_speed);
	}
}