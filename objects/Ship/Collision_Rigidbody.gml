/// @description Insert description here
// You can write your code in this editor
event_inherited();



if (alarm_ready(0) and abs(angle_difference(col_dir + 180, bounce_dir)) < 60) {
	var amount = room_speed * (ceil(0.25 * rel_speed) / knockout_speed);
	alarm_set(0, amount);
}