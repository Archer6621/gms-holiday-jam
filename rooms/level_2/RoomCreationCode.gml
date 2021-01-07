// Music
audio_play_sound(music_2,0,1);
randomize();

// Quick structs
var astr = {
	sprites: [spr_asteroid],
	parallax: 0.35,
	density: 0.000005,
	scale_min: 0.5,
	scale_max: 2.0,
	scale_desync: 0.15,
	rotation_amount: 15,
	tile_rotation_dynamic: 0.5,
	depth_color_offset: 0.3,
	depth_color: c_black,
	opacity_min: 1,
	shaded: true
}

// Base background
create_env_layer({
	sprites: [spr_star_s, spr_star_m, spr_star_l], 
	parallax: 0.01, 
	density: 0.00025, 
	rotation_amount: 0, 
	tile_rotation_amount: 45, 
	depth_color: c_white
});

create_env_layer({
	sprites: [spr_dust], 
	parallax: 0.85, 
	density: 0.00001,
	scale_min: 0.1,
	scale_max: 0.6,
	scale_desync: 0.4,
	tile_rotation_dynamic: 1,
	depth_color: c_white
});


// Stage
{	

	var colors = {hue_shift_min: -0.05, hue_shift_max: 0.05, sat_shift_min: 0.0, sat_shift_max: 0.0, depth_color: c_navy, opacity_max: 0.95, blend_mode: bm_add}
	
	var env_layers = [
		create_env_layer(astr),
		create_env_layer(merge(colors, {sprites: [spr_nebula_5], parallax: 0.4, density: 0.00020, scale_min: 1, scale_max: 4, tile_rotation_dynamic: 2.0})),
		create_env_layer(merge(colors, {sprites: [spr_nebula_5], parallax: 1.25, density: 0.00045, scale_min: 2, scale_max: 3, tile_rotation_dynamic: 4, opacity_max: 0.2, splat_blend_mode: bm_add, blend_mode: bm_normal}))
	] 
	create_stage_volume([Asteroid, EMPDrone], 3000, 13000, 3000, 15, env_layers);
}


{
	var env_layers = [
		create_env_layer({sprites: [spr_nebula, spr_nebula_2, spr_nebula_3], parallax: 0.5, density: 0.0001, scale_min: 3, scale_max: 6, scale_desync: 2.5, tile_rotation_dynamic: 1, shaded: true})
	]
	create_stage_volume([MineLayer], 10000, 40000, 3000, 1, env_layers);
}

{
	var env_layers = [
		create_env_layer({sprites: [spr_nebula_2], parallax: 0.25, density: 0.0002, scale_min: 1, scale_max: 12, scale_desync: 5, tile_rotation_dynamic: 1}),
		create_env_layer({sprites: [spr_nebula_2], parallax: 0.15, density: 0.0002, scale_min: 0.5, scale_max: 9, scale_desync: 5, tile_rotation_dynamic: 0.5}),
		create_env_layer(merge(astr, {parallax: 0.6, scale_min: 0.45, scale_max: 0.65, sat_shift_min: 0.9, sat_shift_max: 0.9, depth_color: merge_colour(c_maroon, c_black, 0.5), depth_color_offset: 5, shader_light_multiplier: 0.5})),
		create_env_layer(merge(astr, {parallax: 0.3, scale_min: 0.2, scale_max: 0.35, sat_shift_min: 0.9, sat_shift_max: 0.9, depth_color: merge_colour(c_maroon, c_black, 0.5), depth_color_offset: 5, shader_light_multiplier: 0.5}))
	]
	create_stage_volume([RedAsteroid], 20000, 50000, 3000, 13, env_layers);
	create_stage_volume([Drone], 35000, 50000, 3000, 1, []);
}