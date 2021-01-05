/// @description Insert description here
// You can write your code in this editor

var pc = image_blend;

if (active()) {
	image_blend = merge_colour(c_aqua, image_blend, 0.5);	
}


draw_self();
if (enabled) {
	gpu_set_blendmode(bm_add);
	draw_self();
	gpu_set_blendmode(bm_normal);
}


image_blend = pc;