/// @description Insert description here
// You can write your code in this editor


// "Observes" an instance
instance = noone;
accessor = undefined;

min_value = 0;
max_value = 0;

b_width  = 0;
b_height = 0;

offset_x = 0;
offset_y = 0;

b_color = c_white;

vertical = false;
follow = false;
reverse = false;

function make_vertical() {
	b_width = b_height;
	b_height = b_width;
	vertical = true;
}

function get_value() {
	if (not is_undefined(accessor)) {
		return clamp(accessor(instance), min_value, max_value);	
	}
	return 0;
}

function draw_bar() {
	var pc = draw_get_color();
	var pa = draw_get_alpha();
	draw_set_alpha(global.ui_alpha);
	draw_set_color(merge_colour(b_color, c_black, 0.8));
	draw_rectangle(x + offset_x, y + offset_y, x + offset_x + b_width, y + offset_y + b_height, false);
	draw_set_color(b_color);

	draw_rectangle(
	x + offset_x,
	y + offset_y,
	x + offset_x + b_width * (reverse ? 1 - get_value()/max_value : get_value() / max_value),
	y + offset_y + b_height,
	false);
	draw_set_color(pc);
	draw_set_alpha(pa);
}