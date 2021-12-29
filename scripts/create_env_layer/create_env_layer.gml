// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// KWARGS:
// sprites, 
// parallax, 
// density, 
// scale_min, 
// scale_max, 
// scale_desync, 
// rotation_amount, 
// tile_rotation_amount, 
// tile_rotation_dynamic, 
// depth_color, 
// depth_color_offset, 
// opacity_min, 
// permanent, 
// shaded


/// @function create_env_layer(param_struct);
/// @param {array} sprites
/// @param {array} sprites_probs
/// @param {real}  parallax 
/// @param {real}  density 
/// @param {real}  scale_min
/// @param {real}  scale_max
/// @param {real}  scale_desync
/// @param {real}  rotation_amount
/// @param {real}  rotation_snap
/// @param {real}  tile_rotation_amount
/// @param {real}  tile_rotation_dynamic
/// @param {real} depth_color
/// @param {real} depth_color_offset
/// @param {real} opacity_min
/// @param {bool} shaded
function create_env_layer(param_struct){
	var env_layer = instance_create(EnvLayer);
	var allowed_names = ["shaded", "sprites", "sprites_probs", "parallax", "density", "scale_min", 
	"scale_max", "scale_desync", "rotation_amount", "tile_rotation_amount", "tile_rotation_dynamic", "depth_color", 
	"depth_color_offset", "opacity_min", "opacity_max", "hue_shift_min", "hue_shift_max", "sat_shift_min", "sat_shift_max",
	"blend_mode", "shader_light_multiplier", "splat_blend_mode", "motion_blur"
	];
	var struct_names = variable_struct_get_names(param_struct);
	for (var i = 0; i < array_length(struct_names); i += 1) {
		if (not array_contains(allowed_names, struct_names[i])) {
			show_error("Parameter " + string(struct_names[i]) + " not recognized", true);	
		}
	}
	
	// TODO: make naming consistent on object...
	//for (var i = 0; i < array_length(struct_names); i += 1) {
	//	if (not variable_instance_exists(env_layer, struct_names[i])) {
	//		show_error("Parameter " + string(struct_names[i]) + " not initialized in EnvLayer object", true);	
	//	}
	//}
	
	// Sprites and their maps
	env_layer.lighting = get(param_struct, "shaded", false);
	env_layer.sprites = get(param_struct, "sprites", [spr_normal_test]);
	env_layer.sprites_n = [];
	for (var i = 0; i < array_length(env_layer.sprites); i += 1) {
		var normal_index = asset_get_index(sprite_get_name(env_layer.sprites[i])+"_n");
		if (normal_index == -1) {
			normal_index = env_layer.sprites[i];
		}
		env_layer.sprites_n[i] = normal_index;
	}
	env_layer.sprites_probs = get(param_struct, "sprites_probs", array_constant(array_length(env_layer.sprites), 1));
	
	// Other params
	env_layer.par = get(param_struct, "parallax", 1.0);
	var d_start = 100;
	var d = d_start + ceil(1 / env_layer.par);
	env_layer.depth = d;
	// temp fix
	if (env_layer.par > 1.0) {
		env_layer.depth -= 110; 
	}
	
	env_layer.density = get(param_struct, "density", 0.0001);
	env_layer.scale_min = get(param_struct, "scale_min", 1);
	env_layer.scale_max = get(param_struct, "scale_max", env_layer.scale_min);
	env_layer.scale_desync = get(param_struct, "scale_desync", 0);
	env_layer.rotation_amount = get(param_struct, "rotation_amount", 360);
	env_layer.tile_rotation_amount = get(param_struct, "tile_rotation_amount", 360);
	env_layer.tile_rotation_dynamic = get(param_struct, "tile_rotation_dynamic", 0);
	env_layer.depth_color = get(param_struct, "depth_color", c_black);
	var depth_color_offset = get(param_struct, "depth_color_offset", 0);
	env_layer.depth_blend = 1 - clamp((d_start - depth_color_offset + 1.5 + 4 - d)/4, 0, 1);
	env_layer.opacity_min = get(param_struct, "opacity_min", 0);
	env_layer.opacity_max = get(param_struct, "opacity_max", 1);
	env_layer.hue_shift_min = get(param_struct, "hue_shift_min", 0);
	env_layer.hue_shift_max = get(param_struct, "hue_shift_max", env_layer.hue_shift_min);
	env_layer.sat_shift_min = get(param_struct, "sat_shift_min", 0);
	env_layer.sat_shift_max = get(param_struct, "sat_shift_max", env_layer.sat_shift_min);
	env_layer.blend_mode =  get(param_struct, "blend_mode", bm_normal);
	env_layer.shader_light_multiplier = get(param_struct, "shader_light_multiplier", 1.0);
	env_layer.splat_blend_mode =  get(param_struct, "splat_blend_mode", bm_normal);
	env_layer.motion_blur = get(param_struct, "motion_blur", false);
	
	// Generate grid
	for (var i = 0; i < env_layer.grid_size; i += 1) {
		for (var j = 0; j < env_layer.grid_size; j += 1) {
			env_layer.grid[i, j] = irandom(array_length(env_layer.surfaces) - 1);
			env_layer.rot_grid[i, j] = irandom(env_layer.tile_rotation_amount);
		}
	}

	return env_layer;
}