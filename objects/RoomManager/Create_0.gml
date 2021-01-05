/// @description Insert description here
// You can write your code in this editor

global.room_manager = id;
transition_speed_out = 0.75;
transition_speed_in = transition_speed_out;
room_to_go = noone;
draw_color = c_black;
blend_mode = bm_normal;
image_alpha = 0;
depth = -100;

function room_goto_transition(room_id, out_length, in_length) {
	transition_speed_out = is_undefined(out_length) ? 0.75 : out_length;
	transition_speed_in = is_undefined(in_length) ? transition_speed_out : in_length;
	room_to_go = room_id;
	image_alpha = 0;
	alarm_set(0, transition_speed_out * room_speed);
	alarm_stop(1);
}