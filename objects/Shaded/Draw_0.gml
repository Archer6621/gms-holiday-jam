/// @description Insert description here
// You can write your code in this editor

var sample = shader_get_sampler_index(light_shader, "normal");
var normal_texture = sprite_get_texture(normal_index, 0);
shader_set(light_shader);
texture_set_stage(sample, normal_texture); 
draw_self();
shader_reset();