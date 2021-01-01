/// @description Insert description here
// You can write your code in this editor


var pa = draw_get_alpha();

draw_set_halign(fa_center);
draw_set_alpha((current_message!=display_message) * sin(0.4 * global.frames));
draw_text(0.5 * display_get_gui_width() + string_width(current_message) * 0.5 + 10, 0.25 * display_get_gui_height(), "<");
draw_set_alpha(pa);
if (fade) {
	image_alpha -= fade_after / room_speed;
	draw_set_alpha(image_alpha);
}
draw_text(0.5 * display_get_gui_width(), 0.25 * display_get_gui_height(), current_message);
draw_set_halign(fa_left);
draw_set_alpha(pa);