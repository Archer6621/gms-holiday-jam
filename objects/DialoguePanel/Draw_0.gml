/// @description Insert description here
// You can write your code in this editor

var pa = draw_get_alpha();
var pc = draw_get_color();

draw_self();


draw_set_alpha(0.9);
draw_set_color(c_black);
draw_rectangle(
	x, 
	y + 2 * avatar_padding + avatar_size, 
	x + sprite_width,
	y + sprite_height,
	false
)
draw_rectangle(
	x + avatar_padding, 
	y + avatar_padding, 
	x + avatar_padding + avatar_size,
	y + avatar_padding + avatar_size,
	false
)

var xo = sprite_get_xoffset(avatar_sprite);
var yo = sprite_get_yoffset(avatar_sprite);
var sx = (avatar_size - 0.5 * avatar_padding) / sprite_get_width(avatar_sprite);
var sy = (avatar_size - 0.5 * avatar_padding) / sprite_get_height(avatar_sprite);
draw_sprite_ext(avatar_sprite,0,
	x + 1.25 * avatar_padding + xo * sx, 
	y + 1.25 * avatar_padding + yo * sy, 
	sx,
	sy,
	0, c_white, 1
);

draw_set_color(c_white);
draw_set_valign(fa_bottom);
draw_set_font(font_large);
draw_text(
	x + 2 * avatar_padding + avatar_size, 
	y + avatar_padding + avatar_size,
	avatar_name
)
draw_set_valign(fa_top);

draw_set_font(font_normal);
draw_text_ext(
	x + avatar_padding, 
	y + 3 * avatar_padding + avatar_size,
	string_upper(text_to_draw),
	string_height(display_text),
	sprite_width - 2 * avatar_padding
)
draw_set_font(-1);

draw_set_alpha(0.4);

draw_set_color(c_dkgrey);
draw_rectangle(
	x + avatar_padding, 
	y + avatar_padding, 
	x + avatar_padding + avatar_size,
	y + avatar_padding + avatar_size,
	true
)
if (highlight) {
	draw_set_color(c_aqua);
}
draw_rectangle(
	x, 
	y, 
	x + sprite_width,
	y + sprite_height,
	true
)


draw_set_alpha(pa);
draw_set_color(pc);