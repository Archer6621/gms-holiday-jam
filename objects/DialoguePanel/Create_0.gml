/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

avatar_size = 96;
avatar_padding = 12;
image_blend = c_ltgray;
display_rate = 0.04 * room_speed;
display_rate_variation = 0.04 * room_speed;

avatar_sprite = spr_ability_placeholder;
avatar_name = "";
display_text = ""
text_to_draw = "";
highlight = false;

function show_dialogue(from, message_string) {
	alarm_stop(0);
	text_to_draw = "";
	display_text = message_string;
	avatar_name = from.name;
	avatar_sprite = from.avatar;
	highlight = true;
	alarm_set(0, display_rate + random(display_rate_variation));
}

function finish() {
	text_to_draw = display_text;
}

function done() {
	return text_to_draw == display_text;	
}