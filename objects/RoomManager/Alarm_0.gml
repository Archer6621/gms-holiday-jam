/// @description Insert description here
// You can write your code in this editor
audio_stop_all();

room_goto(room_to_go);
draw_color = draw_color_in;
d_alarm_set(1, ceil(transition_speed_in * game_get_speed(gamespeed_fps)));
image_alpha = 1;