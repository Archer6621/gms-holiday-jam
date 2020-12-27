/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_set_color(c_lime);
draw_arrow(x, y, x + lengthdir_x(100, bounce_dir), y + lengthdir_y(100, bounce_dir), 20)
draw_set_color(c_red);
draw_arrow(x, y, x + 100 * rel_hspeed, y + 100 * rel_vspeed, 10)
draw_set_color(c_white);