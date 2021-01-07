/// @description Insert description here
// You can write your code in this editor

var pc = image_blend;

if (active()) {
	image_blend = merge_colour(c_white, image_blend,0.125 +  0.2 * (1 + sin(0.03 * global.frames)));
	if (state()) {
		image_blend = merge_colour(c_aqua, image_blend, 0.25);
	}
}


draw_self();
image_blend = pc;
if (enabled) {
	gpu_set_blendmode(bm_add);
	draw_self();
	gpu_set_blendmode(bm_normal);
}

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


