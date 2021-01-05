/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
create_clustered_explosion(x, y, 2 * image_xscale, 6, 0.4, EMPExplosion, [c_aqua, c_blue]);
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_play_sound_at(explosion_emp, x, y, 0, 1000, 0, 2, 0, 0);