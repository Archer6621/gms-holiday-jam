/// @description Insert description here
// You can write your code in this editor

prev_enabled = enabled;
enabled = state();

if (prev_enabled != enabled) {
	event_user(0);	
}