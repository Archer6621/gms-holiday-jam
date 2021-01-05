/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (warping) {
	gpu_set_blendmode(bm_add);
}
event_inherited();
if (warping) {
	draw_self();
	draw_self();
	gpu_set_blendmode(bm_normal);
}

