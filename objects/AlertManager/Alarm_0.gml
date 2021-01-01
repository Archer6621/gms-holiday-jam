/// @description Insert description here
// You can write your code in this editor

current_message += string_char_at(display_message, string_length(current_message) + 1);
randomize();
audio_play_sound(choose(snd_disp_1, snd_disp_2, snd_disp_3), 0, 0);