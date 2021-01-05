/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


// Override
draw = function() {
	var c_color = c_white;
	draw_set_alpha(global.ui_alpha);
	draw_set_color(c_color);
	var count = string(get_value());
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y, count);
	draw_label(0, string_height(string(count)));
}