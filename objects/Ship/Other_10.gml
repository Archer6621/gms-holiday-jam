/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (audio_emitter_exists(engine_emitter)) {
	audio_emitter_gain(engine_emitter, 0.0);

}
ambient_scale = 0.0;
lighting_intensity_scale = 0.8;
emission_strength_scale = 0.0;