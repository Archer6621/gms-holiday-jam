// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_env_layer(sprites, parallax, density, scale_min, scale_max, scale_desync, rotation_amount, tile_rotation_amount, tile_rotation_dynamic, depth_color, depth_color_offset, opacity_min, permanent, shaded){
	var d_start = 100;
	var d = d_start + ceil(1 / parallax);
	var env_layer = instance_create_depth(0, 0, d, EnvLayer);
	env_layer.lighting = is_undefined(shaded) ? false : shaded;
	env_layer.depth_blend = 1 - clamp((d_start - depth_color_offset + 1.5 + 4 - d)/4, 0, 1);
	env_layer.sprites = sprites;
	env_layer.sprites_n = [];
	for (var i = 0; i < array_length(sprites); i += 1) {
		var normal_index = asset_get_index(sprite_get_name(sprites[i])+"_n");
		if (normal_index == -1) {
			normal_index = sprites[i];
		}
		env_layer.sprites_n[i] = normal_index;
	}
	env_layer.par = parallax;
	env_layer.density = density;
	env_layer.scale_min = scale_min;
	env_layer.scale_max = scale_max;
	env_layer.scale_desync = scale_desync;
	env_layer.rotation_amount = rotation_amount;
	env_layer.tile_rotation_amount = tile_rotation_amount;
	env_layer.tile_rotation_dynamic = tile_rotation_dynamic;
	env_layer.depth_color = depth_color;
	env_layer.opacity_min = opacity_min;
	
	if (permanent) {
		env_layer.proximity = 1;	
	}
	
	for (var i = 0; i < env_layer.grid_size; i += 1) {
		for (var j = 0; j < env_layer.grid_size; j += 1) {
			env_layer.grid[i, j] = irandom(array_length(env_layer.surfaces) - 1);
			env_layer.rot_grid[i, j] = irandom(tile_rotation_amount);
		}
	}

	return env_layer;
}