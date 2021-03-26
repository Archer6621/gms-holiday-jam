/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var inst = instance_nearest(x, y, Ship);
if (inst) {
	if (alarm_ready(0) and point_distance(x, y, inst.x, inst.y) < fuse_proximity) {
		d_alarm_set(0, fuse_time * game_get_speed(gamespeed_fps));
	}
}