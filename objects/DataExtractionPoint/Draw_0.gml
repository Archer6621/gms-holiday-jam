/// @description Insert description here
// You can write your code in this editor

var pc = draw_get_color();
var pa = draw_get_alpha();
draw_set_color(c_lime);
draw_set_alpha((0.75 + 0.25 * sin(0.05 * global.frames)));
draw_ellipse(x - extraction_radius/2, y - extraction_radius/2, x + extraction_radius/2, y + extraction_radius/2, true);
draw_set_color(pc);
draw_set_alpha(pa);