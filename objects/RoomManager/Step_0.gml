/// @description Insert description here
// You can write your code in this editor
if (not alarm_ready(0) and alarm_ready(1)) {
	image_alpha = 1 - alarm_get(0) / (room_speed * transition_speed_in);
}
if (not alarm_ready(1) and alarm_ready(0)) {
	image_alpha = alarm_get(1) / (room_speed * transition_speed_out);
}
if (alarm_ready(0) and alarm_ready(1)) {
	image_alpha = 0;	
}