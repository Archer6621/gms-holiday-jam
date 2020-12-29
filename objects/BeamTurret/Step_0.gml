/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (not is_on_screen(2 * sprite_width)) {
	alarm_set(1, alarm_get(1) + 1);	
}

if (behaviour_disabled) {
	alarm_set(1, interval * room_speed);
	alarm_set(0, interval * room_speed);
}