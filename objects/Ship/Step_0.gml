/// @description Insert description here
// You can write your code in this editor
event_inherited();


if (behaviour_disabled) {
	exit;	
}

var dts = d(1) / game_get_speed(gamespeed_fps);

if (alarm_ready(0)) {
	#region Input

	if (go_forward and use_afterburner) {
		if (consume_energy(dts)) {
			d_motion_add(image_angle, 0.1 * dts * acceleration_rate);
			using_afterburner = true;
			part_particles_create(global.ps_add, x, y, global.afterburner_particle, 1);
		}
	} else {
		using_afterburner = false;
	}
	
	if (go_forward and do_burst) {
		if (consume_energy(1)) {
			d_motion_add(image_angle, max_speed);
			audio_play_sound_at(hawk_engine_burst, x, y, 0, 1000, 0, 2, 0, 0);
			part_particles_create(global.ps_add, x, y, global.burst_particle, 100);
		}
	}

	if (go_forward) {
		d_motion_add(image_angle, dts * acceleration_rate);
		part_particles_create(global.ps, x, y, engine_trail_particle, 1);
		part_particles_create(global.ps_add, x, y, global.default_engine_paticle, 1);
	}
	
	if (go_back) {
		d_speed = d_speed / 1.01;	
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
	d_speed = d_speed / 1.005;
}

#region Resources
// Reactor and afterburner
if (not consumed_energy) {
	reactor_charge += dts * reactor_charge_rate;
}
if (reactor_charge > 0.5 * reactor_capacity) {
	reactor_overheated = false;	
}
reactor_charge = clamp(reactor_charge, 0, reactor_capacity);
#endregion

#region Limits
if (d_speed > max_speed) {
	d_motion_add(direction + 180, dts * acceleration_rate);
	//d_speed = d_speed / (1 + p_friction / game_get_speed(gamespeed_fps));
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
if (using_afterburner) {
	audio_emitter_gain(afterburner_emitter, 2.0);	
} else {
	audio_emitter_gain(afterburner_emitter, 0.0);	
}

if (go_forward) {
	audio_emitter_gain(engine_emitter, 1.0);	
} else {
	audio_emitter_gain(engine_emitter, 0.0);	
}


#endregion
