/// @description Insert description here
// You can write your code in this editor
audio_stop_all();

room_goto(room_to_go);
draw_color = draw_color_in;
alarm_set(1, ceil(transition_speed_in * room_speed));
image_alpha = 1;