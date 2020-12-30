/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (audio_emitter_exists(engine_emitter)) {
	audio_emitter_free(engine_emitter);
} 

if (audio_emitter_exists(afterburner_emitter)) {
	audio_emitter_free(afterburner_emitter);
} 

