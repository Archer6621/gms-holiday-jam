/// @description Insert description here
// You can write your code in this editor

if (not follow) {
	var pc = draw_get_color();
	var pa = draw_get_alpha();
	draw();	
	draw_set_color(pc);
	draw_set_alpha(pa);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}