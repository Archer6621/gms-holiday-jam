/// @description Insert description here
// You can write your code in this editor
var pa = draw_get_alpha();
var pc = draw_get_color();
draw_set_color(c_aqua);
draw_set_alpha(0.5);
draw_rectangle(0, -100, room_width, y, false);
draw_set_alpha(pa);
draw_set_color(pc);