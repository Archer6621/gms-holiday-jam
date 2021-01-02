/// @description Insert description here
// You can write your code in this editor

var pc = draw_get_color();
var pa = draw_get_alpha();
draw_set_color(c_lime);
if (hawk_dist < extraction_radius) {
	draw_set_color(c_aqua);	
}
draw_set_alpha((0.75 + 0.25 * sin(0.05 * global.frames)));
draw_ellipse(x - extraction_radius, y - extraction_radius, x + extraction_radius, y + extraction_radius, true);
draw_set_color(pc);
draw_set_alpha(pa);