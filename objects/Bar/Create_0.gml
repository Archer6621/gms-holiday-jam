/// @description Insert description here
// You can write your code in this editor
event_inherited();

b_width  = 0;
b_height = 0;

b_colors = [c_white];

vertical = false;
reverse = false;

function make_vertical() {
	b_width = b_height;
	b_height = b_width;
	vertical = true;
}

// Override
draw = function() {
	var b_color = b_colors[state_accessor(instance)];
	draw_set_alpha(global.ui_alpha);
	draw_set_color(merge_colour(b_colors[0], c_black, 0.8));
	draw_rectangle(x, y, x + b_width, y + b_height, false);
	draw_set_color(b_color);

	draw_rectangle(
	x,
	y,
	x + b_width * (reverse ? 1 - get_value()/max_value : get_value() / max_value),
	y + b_height,
	false);
	draw_set_color(b_colors[0]);
	draw_label(b_width, b_height);
}