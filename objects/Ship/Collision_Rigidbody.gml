/// @description Insert description here
// You can write your code in this editor
event_inherited();

var rel_speed_dir = point_direction(0, 0, rel_hspeed, rel_vspeed);
if (alarm_ready(0) and abs(angle_difference(rel_speed_dir, bounce_dir)) < 60) {
	var amount = room_speed * (ceil(0.25 * rel_speed) / knockout_speed);
	alarm_set(0, amount);
}