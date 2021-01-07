/// @description Insert description here
// You can write your code in this editor

// Shader uniform 
u_h_shift = shader_get_uniform(hue_shift_shader, "h_shift");
u_s_shift = shader_get_uniform(hue_shift_shader, "s_shift");

u_ambient = shader_get_uniform(bg_light_shader, "ambient");
u_lighting_intensity = shader_get_uniform(bg_light_shader, "lighting_intensity");
u_emission_strength = shader_get_uniform(bg_light_shader, "emission_strength");
u_normal_strength = shader_get_uniform(bg_light_shader, "normal_strength");
u_cos_angle = shader_get_uniform(bg_light_shader, "cos_angle");
u_sin_angle = shader_get_uniform(bg_light_shader, "sin_angle");
u_depth = shader_get_uniform(bg_light_shader, "depth");
normal_sampler = shader_get_sampler_index(bg_light_shader, "normal");
emission_sampler = shader_get_sampler_index(bg_light_shader, "emission");

// Other constants
grid_size = 12;

// Variable initializations
proximity = 1; // Visible by default
rot = 0;
scaling = 0.5;
sw = 1024;
sh = 1024;
surfaces = [noone, noone, noone];
surfaces_n = [noone, noone, noone];
redraw = [true, true, true];
depth_blend = 0;
grid = []
rot_grid = []
randomize();
rotation_multiplier = 1 - random(2);
rotation_multiplier += sign(rotation_multiplier) * 0.5;

// Property initializations (defaults are in factory function "create_env_layer")
overlap = 0.4;
lighting = false;
par = 0;
sprites = [];
sprites_probs = []; 
density = 0;
scale_min = 0;
scale_max = 0;
scale_desync = 0;
rotation_amount = 0;
tile_rotation_amount = 0;
tile_rotation_dynamic = 0;
depth_color = c_black;
opacity_min = 0;
opacity_max = 0;
hue_shift_min = 0;
hue_shift_max = 0;
sat_shift_min = 0;
sat_shift_max = 0;
shader_light_multiplier = 1.0;
blend_mode = bm_normal;
splat_blend_mode = bm_normal;

// Overrides for other drawing tasks
override = false;
override_surf = noone;

function set_override(spd, dir, surf) {
	override = true;
	speed = spd;
	direction = dir;
	override_surf = surf;
}