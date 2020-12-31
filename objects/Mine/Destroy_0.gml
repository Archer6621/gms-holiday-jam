/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

create_colored_explosion(x,y, 3, c_fuchsia, c_navy);
audio_play_sound_at(choose(explosion_1, explosion_2), x, y, 0, 1000, 0, 2, 0, 0);