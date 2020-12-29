/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Constants
acceleration_rate = 30;
turn_acceleration_rate = 5000;
max_speed = 6;
max_turn_speed = 270;
knockout_speed = 2;

// Physics
density = 0.5;
elasticity = 1.5;

// Initializations
turn_acceleration = 0;
image_angle = 90;

// Sound
engine_emitter = -1;
engine_sound = undefined;

function knock_out(amount) {
	if (alarm_ready(0)) {
		alarm_set(0, room_speed * amount);
	}
}

function initialize_sound(sound, pitch) {
	if (not audio_emitter_exists(engine_emitter) and sound != undefined) {
		engine_sound = sound;
		self.engine_emitter = audio_emitter_create();
		audio_emitter_pitch(engine_emitter, pitch);
		audio_play_sound_on(engine_emitter, engine_sound, true, 0);
	}
}