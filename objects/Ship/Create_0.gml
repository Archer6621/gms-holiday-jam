/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Constants
acceleration_rate = 30;
turn_acceleration_rate = 5000;
max_speed = 7;
max_turn_speed = 270;
knockout_speed = 2;

// Physics
density = 0.5;
elasticity = 1.5;

// Initializations
turn_acceleration = 0;
image_angle = 90;

function knock_out(amount) {
	if (alarm_ready(0)) {
		alarm_set(0, room_speed * amount);
	}
}