/// @description Insert description here
// You can write your code in this editor
audio_stop_all();

if (array_contains(global.levels, room_to_go)) {
	draw_color = c_aqua;
	blend_mode = bm_add;
}
room_goto(room_to_go);
alarm_set(1, transition_speed_in * room_speed);
image_alpha = 1;