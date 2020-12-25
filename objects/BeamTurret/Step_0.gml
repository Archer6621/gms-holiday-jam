/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (not is_on_screen(2 * sprite_width)) {
	alarm_set(1, alarm_get(1) + 1);	
}