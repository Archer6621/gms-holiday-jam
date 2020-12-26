// Hawk
instance_create_layer(room_width/2, room_height - 100, "Instances", Hawk);
show_debug_overlay(true);
// Camera
zoom = 0.95;
camera_set_view_size(view_camera[0], view_wport[0] * zoom, view_hport[0] * zoom)
camera_set_view_target(view_camera[0], Hawk)

// Base background
create_env_layer([spr_star_s, spr_star_m, spr_star_l], 0.01, 0.00015, 1, 1, 0, 0, 180, 0, c_white, true);
create_env_layer([spr_dust], 0.85,  0.00001, 0.1, 0.6, 0.4, 360, 360, 0, c_white, true);
//create_env_layer(spr_dust_2, 0.75,  0.0001, 1, 1, 0.0, 360, 360, 0, c_white, true);

// Stage
{
	var env_layers = [
		create_env_layer([spr_nebula], 0.6,  0.00005, 4, 7, 0.5, 360, 360, 1, c_navy, false),
		create_env_layer([spr_nebula], 0.45, 0.00010, 3.5, 6.5, 0.5, 360, 360, 0.5, c_navy, false),
		create_env_layer([spr_nebula], 0.3,  0.00015, 3, 6, 0.5, 360, 360, 0.25, c_navy, false)
	] 
	create_stage_volume([Asteroid], 5000, 12000, 2000, 10, env_layers);
}

{
	var env_layers = [
		create_env_layer([spr_nebula_4_blur], 0.5, 0.000015, 3-1, 7-1, 0.15, 360, 360, 1, c_red, false),
		create_env_layer([spr_nebula_4_blur], 0.375, 0.000025, 3-1, 7-1, 0.15, 360, 360, 0.75, c_red, false),
		create_env_layer([spr_nebula_4_blur], 0.25, 0.000035, 2-1, 6-1, 0.5, 360, 360, 0.5, c_red, false)
	]
	create_stage_volume([RedAsteroid], 2000, 9000, 1000, 2, env_layers);
}

{
	var env_layers = [
		create_env_layer([spr_nebula_3], 0.5, 0.000025, 4, 7, 0.5, 360, 360, 1, c_red, false),
		create_env_layer([spr_nebula_2], 0.25, 0.000015, 8, 12, 2, 360, 360, 0.5, c_red, false)
	]
	create_stage_volume([Drone], 10000, 20000, 2000, 3, env_layers);
}

{
	var env_layers = [
		create_env_layer([spr_charge_blur], 0.25, 0.000025, 4, 7, 3, 360, 360, 1, c_orange, false),
		create_env_layer([spr_nebula_4], 0.3, 0.000085, 3, 6, 3, 360, 360, 0.5, c_green, false)
	]
	create_stage_volume([BeamTurret], 20000, 30000, 2000, 3, env_layers);
}
//