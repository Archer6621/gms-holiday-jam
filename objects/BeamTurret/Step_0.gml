/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (not is_on_screen(2 * sprite_width)) {
	alarm_pause(0);
	alarm_pause(1);
}

if (behaviour_disabled) {
	alarm_stop(0);
	alarm_stop(1);
}