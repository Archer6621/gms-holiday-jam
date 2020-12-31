/// @description Insert description here
// You can write your code in this editor

if (not is_on_screen(max(sprite_width, sprite_height))) {
	exit;	
}

shader_set(light_shader);
shader_set_uniform_f(u_cos_angle, cos(degtorad(image_angle)));
shader_set_uniform_f(u_sin_angle, sin(degtorad(image_angle)));
shader_set_uniform_f(u_ambient, ambient_scale * s_ambient);
shader_set_uniform_f(u_lighting_intensity, lighting_intensity_scale * s_lighting_intensity);
shader_set_uniform_f(u_emission_strength, emission_strength_scale * s_emission_strength);
shader_set_uniform_f(u_normal_strength, normal_strength_scale * s_normal_strength);
texture_set_stage(normal_sampler, normal_texture); 
texture_set_stage(emission_sampler, emission_texture); 
draw_self();
shader_reset();
