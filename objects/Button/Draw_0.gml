/// @description Insert description here
// You can write your code in this editor


draw_self();

var pc = draw_get_color();
var pa = draw_get_alpha();
draw_set_color(c_black);
draw_set_alpha(0.35);
draw_rectangle(x, y, x+sprite_width, y+sprite_height, true);
draw_set_color(pc);
draw_set_alpha(pa);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(font_large);

draw_text_transformed(
	x + sprite_width/2,
	y + sprite_height/2,
	string_upper(text),
	text_scale,
	text_scale,
	0
)
draw_set_font(-1);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
