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

// Sound
//if (audio_emitter_free(engine_emitter)) {
//	show_debug_message("playing");
//	audio_play_sound_on(engine_emitter, engine_sound, true, 5);	
//}
audio_emitter_position(engine_emitter, x, y, 0.0);
audio_emitter_velocity(engine_emitter, hspeed, vspeed, 0.0);
if (go_forward) {
	audio_emitter_gain(engine_emitter, 1.0);	
} else {
	audio_emitter_gain(engine_emitter, 0.0);	
}
