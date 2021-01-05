/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Constants
acceleration_rate = 30;
turn_acceleration_rate = 5000;
max_speed = 6;
max_turn_speed = 270;
knockout_speed = 2;
knockout_factor = 1;
reactor_charge_rate = 0.25;
reactor_capacity = 2.0;
reactor_overheated = false;
consumed_energy = false;
using_afterburner = false;
emp_immune = false;

// Physics
density = 0.5;
elasticity = 1.5;

// Initializations
turn_acceleration = 0;
image_angle = 90;
reactor_charge = reactor_capacity;

// Sound
engine_emitter = -1;
afterburner_emitter = -1;
engine_sound = undefined;

// Particles
engine_trail_particle = global.hawk_engine_paticle;

// Inputs
go_left = false;
go_right = false; 
go_forward = false;
go_back = false;
use_afterburner = false;
do_burst = false;



function knock_out(amount) {	
	if (alarm_ready(0)) {
		var rounded  = ceil(knockout_factor * amount * knockout_speed) / knockout_speed;
		alarm_set(0, room_speed * rounded);
	}
}

function initialize_sound(sound, pitch) {
	audio_falloff_set_model(audio_falloff_exponent_distance);
	if (sound != undefined) {
		if (not audio_emitter_exists(engine_emitter)) {
			engine_sound = sound;
			engine_emitter = audio_emitter_create();
			audio_emitter_pitch(engine_emitter, pitch);
			audio_play_sound_on(engine_emitter, engine_sound, true, 0);
		}
	
		if (not audio_emitter_exists(afterburner_emitter)) {
			afterburner_emitter = audio_emitter_create();
			audio_emitter_pitch(afterburner_emitter, 2 * pitch);
			audio_emitter_gain(afterburner_emitter, 1.5);
			audio_play_sound_on(afterburner_emitter, engine_sound, true, 0);
		}
	}
}

function consume_energy(amount) {
	if (reactor_overheated) {
		return false;	
	}
	if (reactor_charge - amount < 0) {
		reactor_overheated = true;
		event_user(4);
		return false;
	}
	reactor_charge -= amount;
	consumed_energy = true;
	return true;
}