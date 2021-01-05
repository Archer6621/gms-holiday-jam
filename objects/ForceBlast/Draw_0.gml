/// @description Insert description here
// You can write your code in this editor
gpu_set_blendmode(bm_add);
image_alpha /= 1.01;
draw_self();
gpu_set_blendmode(bm_normal);