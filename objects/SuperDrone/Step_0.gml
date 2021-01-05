/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (behaviour_disabled) {
	exit;	
}

// slower outside of nova
if (not in_shockwave) {
	var dts = 1 / room_speed;
	motion_add(direction + 180, dts * 1.0 * max_speed);	
}