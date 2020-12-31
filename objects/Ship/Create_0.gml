/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Constants
acceleration_rate = 30;
turn_acceleration_rate = 5000;
max_speed = 6;
max_turn_speed = 270;
knockout_speed = 2;
afterburner_charge_rate = 0.25;
afterburner_capacity = 2.0;
afterburner_depleted = false;

// Physics
density = 0.5;
elasticity = 1.5;

// Initializations
turn_acceleration = 0;
image_angle = 90;
afterburner_charge = afterburner_capacity;

// Sound
engine_emitter = -1;
afterburner_emitter = -1;
engine_sound = undefined;

// Particles
engine_trail_particle = global.hawk_engine_paticle;




function knock_out(amount) {
	if (alarm_ready(0)) {
		alarm_set(0, room_speed * amount);
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
			audio_play_sound_on(afterburner_emitter, engine_sound, true, 0);
		}
	}
}

function can_use_afterburner() {
	return go_forward and not afterburner_depleted;
}