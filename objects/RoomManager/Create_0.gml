/// @description Insert description here
// You can write your code in this editor
event_inherited();
global.ui_lock = false;

global.room_manager = id;
transition_speed_out = 0.75;	// Transition speed OUT of CURRENT room
transition_speed_in = transition_speed_out; // Transition speed INTO the NEXT room
room_to_go = noone;
draw_color = c_black;
draw_color_out = c_black;
draw_color_in = c_black;
blend_mode = bm_normal;
image_alpha = 0;
depth = -100;

function room_goto_transition(room_id, out_length, in_length, out_color, in_color) {
	transition_speed_out = is_undefined(out_length) ? 0.75 : out_length;
	transition_speed_in = is_undefined(in_length) ? transition_speed_out : in_length;
	draw_color_out = is_undefined(out_color) ? c_black : out_color;
	draw_color_in = is_undefined(in_color) ? draw_color_out : in_color;
	draw_color = draw_color_out;
	room_to_go = room_id;
	image_alpha = 0;
	d_alarm_set(0, ceil(transition_speed_out * game_get_speed(gamespeed_fps)));
	alarm_stop(1);
}