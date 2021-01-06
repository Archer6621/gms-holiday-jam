// Music
audio_play_sound(music_3,0,1);
randomize();

// Quick structs
var nebula_params = {
	sprites: [spr_nebula], 
	parallax: 0.6, 
	density: 0.00005,
	scale_min: 4,
	scale_max: 7,
	scale_desync: 0.5,
	tile_rotation_dynamic: 1,
	depth_color: c_navy
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
	
	
	var env_layers = [
		create_env_layer(nebula_params),
		create_env_layer(merge(nebula_params, {parallax: 0.45, density: 0.00010, scale_min: 3.5, scale_max: 6.5, tile_rotation_dynamic: 0.5, shaded: true})),
		create_env_layer(merge(nebula_params, {parallax: 0.3, density: 0.00015, scale_min: 3, scale_max: 6, tile_rotation_dynamic: 0.25}))
	] 
	create_stage_volume([Asteroid, VolatileAsteroid], 3000, 12000, 3000, 10, env_layers);
}

{
	var env_layers = [
	]
	create_stage_volume([RedAsteroid], 2000, 9000, 1000, 1, env_layers);
}

{	
	var neb	 = merge(nebula_params, {sprites: [spr_nebula_3], parallax: 0.5, density: 0.000025, depth_color: c_red});
	var neb2 = merge(neb, {sprites: [spr_nebula_2], parallax: 0.3, density: 0.000015, scale_min: 8, scale_max: 12, scale_desync: 2, tile_rotation_dynamic: 0.5});
	var env_layers = [
		create_env_layer(merge(neb, {shaded: true})),
		create_env_layer(neb2),
		create_env_layer(merge(neb2, {density: 0.000018, parallax: 0.25, scale_min: 3, scale_max: 6}))
	]
	create_stage_volume([Drone], 8000, 20000, 3000, 1, env_layers);
}

{
	var charge = {
		sprites: [spr_charge_blur], 
		parallax: 0.15, 
		density: 0.000025, 
		scale_min: 4, 
		scale_max: 7, 
		scale_desync: 3, 
		tile_rotation_dynamic: 1, 
		depth_color: c_orange
	}
	var neb = {
		sprites: [spr_nebula], 
		parallax: 0.3, 
		density: 0.000085, 
		scale_min: 3, 
		scale_max: 6, 
		scale_desync: 3, 
		tile_rotation_dynamic: 0.5, 
		depth_color: c_green, 
		shaded: true
	}
	var env_layers = [
		create_env_layer(charge),
		create_env_layer(merge(charge, {parallax: 0.2, density: 0.000005, scale_min: 2, scale_max: 4, scale_desync: 1})),
		create_env_layer(neb)
	]
	create_stage_volume([BeamTurret], 16000, 30000, 4000, 3, env_layers);
}

{
	var neb = {
		sprites: [spr_nebula_4_blur],
		parallax: 0.5,
		density: 0.000015,
		scale_min: 2,
		scale_max: 6,
		scale_desync: 0.15,
		depth_color: c_red,
		tile_rotation_dynamic: 1
	}
	var env_layers = [
		create_env_layer(neb),
		create_env_layer(merge(neb, {parallax: 0.375, density: 0.000025, tile_rotation_dynamic: 0.75})),
		create_env_layer(merge(neb, {parallax: 0.250, density: 0.000035, tile_rotation_dynamic: 0.50, scale_min: 1, scale_max: 5, scale_desync: 0.5}))
	]
	create_stage_volume([RedAsteroid, Drone, SuperDrone], 28000, 40000, 3000, 3, env_layers);
}

{
	var astr = {
		sprites: [spr_asteroid],
		parallax: 0.45,
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
	var neb = {
		sprites: [spr_nebula],
		parallax: 0.35,
		density: 0.00095,
		scale_min: 3,
		scale_max: 6,
		scale_desync: 3,
		tile_rotation_dynamic: 0.5,
		depth_color: c_green,
		depth_color_offset: 0.5
	}
	
	var env_layers = [
		create_env_layer(astr),
		create_env_layer(merge(astr, {parallax: 0.3, density: 0.000015, scale_min: 0.25, scale_max: 1, tile_rotation_dynamic: 0.25, depth_color_offset: -0.2})),
		create_env_layer(neb),
		create_env_layer(merge(neb, {parallax: 0.5, density: 0.000065, depth_color_offset: 2.5}))
	];
	create_stage_volume([VolatileAsteroid], 36000, 58000, 8000, 5, env_layers);	
}