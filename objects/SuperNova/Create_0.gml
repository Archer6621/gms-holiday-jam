/// @description Insert description here
// You can write your code in this editor

y = room_height + 800;

supernova_speed = 800; // Pixels / sec
terminal_horizon = 2500; 

shockwave_emitter = audio_emitter_create();
terminal_horizon_emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance)
audio_emitter_falloff(shockwave_emitter, 200, 200, 2)
audio_emitter_falloff(terminal_horizon_emitter, 1500, 1500, 2)
audio_play_sound_on(shockwave_emitter, shockwave, true, 0);
audio_play_sound_on(shockwave_emitter, shockwave_static, true, 0);
audio_play_sound_on(terminal_horizon_emitter, obliteration, true, 0);
audio_emitter_gain(terminal_horizon_emitter, 0.5)
