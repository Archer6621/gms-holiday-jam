/// @description Insert description here
// You can write your code in this editor


var normal_name = sprite_get_name(sprite_index)+"_n";
var normal_index = asset_get_index(normal_name);
if (normal_index == -1) {
	normal_index = sprite_index;	// TODO: Add placeholder
}
var emission_name = sprite_get_name(sprite_index)+"_e";
var emission_index = asset_get_index(emission_name);
if (emission_index == -1) {
	emission_index = sprite_index;	// TODO: Add placeholder
}
normal_sampler = shader_get_sampler_index(light_shader, "normal");
emission_sampler = shader_get_sampler_index(light_shader, "emission");
normal_texture = sprite_get_texture(normal_index, 0);
emission_texture = sprite_get_texture(emission_index, 0);
u_ambient = shader_get_uniform(light_shader, "ambient");
u_lighting_intensity = shader_get_uniform(light_shader, "lighting_intensity");
u_emission_strength = shader_get_uniform(light_shader, "emission_strength");
u_normal_strength = shader_get_uniform(light_shader, "normal_strength");
u_cos_angle = shader_get_uniform(light_shader, "cos_angle");
u_sin_angle = shader_get_uniform(light_shader, "sin_angle");

// Shader params
s_ambient = 0.3;
s_lighting_intensity = 0.50;
s_emission_strength = 3.0;
s_normal_strength = 1.0;

ambient_scale = 1.0;
lighting_intensity_scale = 1.0;
emission_strength_scale = 1.0;
normal_strength_scale = 1.0;