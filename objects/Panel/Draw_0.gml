/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(font);

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