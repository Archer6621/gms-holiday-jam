/// @description Insert description here
// You can write your code in this editor
if (image_alpha > 0) {
	var pc = draw_get_color();
	var pa = draw_get_alpha();
	draw_set_color(draw_color);
	draw_set_alpha(image_alpha);
	gpu_set_blendmode(blend_mode);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_set_color(pc);
	draw_set_alpha(pa);
	gpu_set_blendmode(bm_normal);
}