/// @description Insert description here
// You can write your code in this editor
event_inherited();

var dts = 1 / room_speed;

if (alarm_get(0) == -1) {
	#region Input

	if (go_forward) {
		motion_add(image_angle, dts * acceleration_rate);
	}
	
	if (go_back) {
		speed = speed / 1.01;	
	}

	if (go_left) {
		turn_acceleration = max(0, turn_acceleration + dts * turn_acceleration_rate);
		image_angle += dts * clamp(turn_acceleration, -max_turn_speed, max_turn_speed);
	}

	if (go_right) {
		turn_acceleration = min(0, turn_acceleration - dts * turn_acceleration_rate);
		image_angle += dts * clamp(turn_acceleration, -max_turn_speed, max_turn_speed);
	}
	#endregion
} else {
	image_angle += dts * 360 * knockout_speed;	
}

#region Limits
if (speed > max_speed) {
	motion_add(direction + 180, dts * acceleration_rate);
	//speed = speed / (1 + p_friction / room_speed);
}
#endregion

