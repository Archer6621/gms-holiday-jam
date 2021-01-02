/// @description Insert description here
// You can write your code in this editor

overlap = 0.4;
scaling = 0.5;
sw = 1024;
sh = 1024;
surfaces = [noone, noone, noone];
surfaces_n = [noone, noone, noone];

redraw = [true, true, true];
lighting = false;

rot = 0;
u_ambient = shader_get_uniform(bg_light_shader, "ambient");
u_lighting_intensity = shader_get_uniform(bg_light_shader, "lighting_intensity");
u_emission_strength = shader_get_uniform(bg_light_shader, "emission_strength");
u_normal_strength = shader_get_uniform(bg_light_shader, "normal_strength");
u_cos_angle = shader_get_uniform(bg_light_shader, "cos_angle");
u_sin_angle = shader_get_uniform(bg_light_shader, "sin_angle");
u_depth = shader_get_uniform(bg_light_shader, "depth");
normal_sampler = shader_get_sampler_index(bg_light_shader, "normal");
emission_sampler = shader_get_sampler_index(bg_light_shader, "emission");

// Initializations
proximity = 0;
par = 1;
sprites = [];
density = 0;
scale_min = 0;
scale_max = 0;
scale_desync = 0;
rotation_amount = 0;
tile_rotation_amount = 0;
tile_rotation_dynamic = 0;
grid = []
rot_grid = []
depth_color = c_white;
depth_blend = 0;
opacity_min = 0;
grid_size = 4 * array_length(surfaces);


