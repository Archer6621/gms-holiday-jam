/// @description Insert description here
// You can write your code in this editor
event_inherited();

var dts = 1 / room_speed;

if (alarm_get(0) == -1) {
	#region Input

	if (can_use_afterburner() and use_afterburner) {
		//create_spark(c_orange, x, y, 1, false);
		motion_add(image_angle, 0.1 * dts * acceleration_rate);
		part_particles_create(global.ps, x, y, global.afterburner_particle, 1);
	}

	if (go_forward) {
		motion_add(image_angle, dts * acceleration_rate);
		part_particles_create(global.ps, x, y, engine_trail_particle, 1);
		part_particles_create(global.ps, x, y, global.default_engine_paticle, 1);
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
	speed = speed / 1.005;
}

#region Resources
if (use_afterburner) {
	afterburner_charge -= dts * 1.0;
} else {
	afterburner_charge += dts * afterburner_charge_rate;
}
if (afterburner_charge < 0) {
	afterburner_depleted = true;	
}
if (afterburner_charge > 0.5 * afterburner_capacity) {
	afterburner_depleted = false;	
}
afterburner_charge = clamp(afterburner_charge, 0, afterburner_capacity);
#endregion

#region Limits
if (speed > max_speed) {
	motion_add(direction + 180, dts * acceleration_rate);
	//speed = speed / (1 + p_friction / room_speed);
}

// To prevent cheezing the game by border-hugging
if (x < 0 or x > room_width) {
	knock_out(0.1);	
}
#endregion

#region Sound
audio_emitter_position(engine_emitter, x, y, 0.0);
audio_emitter_velocity(engine_emitter, hspeed, vspeed, 0.0);
audio_emitter_position(afterburner_emitter, x, y, 0.0);
audio_emitter_velocity(afterburner_emitter, hspeed, vspeed, 0.0);
if (go_forward) {
	audio_emitter_gain(engine_emitter, 1.0);	
} else {
	audio_emitter_gain(engine_emitter, 0.0);	
}

if (can_use_afterburner() and use_afterburner)  {
	audio_emitter_gain(afterburner_emitter, 2.0);		
} else {
	audio_emitter_gain(afterburner_emitter, 0.0);		
}

#endregion
