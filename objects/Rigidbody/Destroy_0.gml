/// @description Insert description here
// You can write your code in this editor
create_clustered_explosion(x, y, image_xscale, 6, 0.4);
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_play_sound_at(choose(explosion_1, explosion_2), x, y, 0, 1000, 0, 2, 0, 0);