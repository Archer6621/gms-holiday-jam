/// @description Insert description here
// You can write your code in this editor


shader_set(light_shader);
texture_set_stage(sample, normal_texture); 
draw_self();
shader_reset();