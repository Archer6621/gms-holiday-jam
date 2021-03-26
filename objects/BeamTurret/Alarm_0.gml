/// @description Insert description here
// You can write your code in this editor
audio_play_sound_at(beam_charge, x, y, 0, 1000, 0, 2, 0, 0);
d_alarm_set(1, audio_sound_length(beam_charge) * game_get_speed(gamespeed_fps));