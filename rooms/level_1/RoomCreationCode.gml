// Music
audio_play_sound(music_1,0,1);

// Data extraction point
var x_margin = 1000;
instance_create_depth(x_margin + random(room_width - x_margin), 0.1 * room_height + random(0.8 * room_height), 0, DataExtractionPoint);

// Stage
{
	var env_layers = [
		create_env_layer([spr_nebula], 0.6,  0.00005, 4, 7, 0.5, 360, 360, 1, c_navy, 0, 0, false),
		create_env_layer([spr_nebula], 0.45, 0.00010, 3.5, 6.5, 0.5, 360, 360, 0.5, c_navy, 0, 0, false),
		create_env_layer([spr_nebula], 0.3,  0.00015, 3, 6, 0.5, 360, 360, 0.25, c_navy, 0, 0, false)
	] 

	create_stage_volume([Asteroid, VolatileAsteroid], 3000, 12000, 3000, 10, env_layers);
}

{
	var env_layers = [
	]
	create_stage_volume([RedAsteroid], 2000, 9000, 1000, 1, env_layers);
}

{
	var env_layers = [
		create_env_layer([spr_nebula_3], 0.5, 0.000025, 4, 7, 0.5, 360, 360, 1, c_red, 0, 0, false),
		create_env_layer([spr_nebula_2], 0.25, 0.000015, 8, 12, 2, 360, 360, 0.5, c_red, 0, 0, false),
		create_env_layer([spr_nebula_2], 0.25, 0.000018, 3, 6, 2, 360, 360, 0.5, c_red, 0, 0, false)
	]
	create_stage_volume([Drone], 8000, 20000, 3000, 1, env_layers);
}

{
	var env_layers = [
		create_env_layer([spr_charge_blur], 0.15, 0.000025, 4, 7, 3, 360, 360, 1, c_orange, 0, 0, false),
		create_env_layer([spr_charge_blur], 0.2, 0.000005, 2, 4, 1, 360, 360, 1, c_orange, 0, 0, false),
		create_env_layer([spr_nebula], 0.3, 0.000085, 3, 6, 3, 360, 360, 0.5, c_green, 0, 0, false)
	]
	create_stage_volume([BeamTurret], 16000, 30000, 4000, 3, env_layers);
}

{
	var env_layers = [
		create_env_layer([spr_nebula_4_blur], 0.5, 0.000015, 3-1, 7-1, 0.15, 360, 360, 1, c_red, 0, 0, false),
		create_env_layer([spr_nebula_4_blur], 0.375, 0.000025, 3-1, 7-1, 0.15, 360, 360, 0.75, c_red, 0, 0, false),
		create_env_layer([spr_nebula_4_blur], 0.25, 0.000035, 2-1, 6-1, 0.5, 360, 360, 0.5, c_red, 0, 0, false)
	]
	create_stage_volume([RedAsteroid, Drone, SuperDrone], 28000, 40000, 3000, 3, env_layers);
}

{
	var env_layers = [
		create_env_layer([spr_asteroid], 0.45, 0.000005, 0.5, 2, 0.15, 360, 360, 0.5, c_black, 0.1, 1, false),
		create_env_layer([spr_asteroid], 0.3, 0.000015, 0.25, 1, 0.15, 360, 360, 0.25, c_black, -0.7, 1, false),
		create_env_layer([spr_nebula], 0.3, 0.000085, 3, 6, 3, 360, 360, 0.5, c_green, 0, 0, false),
		create_env_layer([spr_nebula], 0.5, 0.000045, 3, 6, 3, 360, 360, 0.5, c_green, 2, 0, false)
	];
	create_stage_volume([VolatileAsteroid], 36000, 58000, 8000, 5, env_layers);	
}