// Music
audio_play_sound(music_5,0,1);
randomize();

global.endless = true;

// Quick structs
var nebula_params = {
	sprites: [spr_nebula], 
	parallax: 0.65, 
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
	sprites: [spr_star_l, spr_star_m], 
	parallax: 0.85, 
	density: 0.00005,
	scale_min: 0.9,
	scale_max: 1.2,
	scale_desync: 0.4,
	tile_rotation_dynamic: 1,
	depth_color: c_yellow,
	motion_blur: true
});




// Stage
{
	var env_layers = [
		create_env_layer(nebula_params),
		create_env_layer({
	sprites: [spr_star_l, spr_star_l, spr_star_l, spr_star_l, spr_star_l, spr_star_l, spr_star_l, spr_star_l, spr_star_l, spr_star_l, spr_star_l, spr_star_l, spr_dust], 
	parallax: 0.6, 
	density: 0.0001,
	scale_min: 0.1,
	scale_max: 0.6,
	scale_desync: 0.4,
	tile_rotation_dynamic: 1,
	depth_color: c_yellow,
	motion_blur: true
}),
		create_env_layer(merge(nebula_params, {parallax: 0.5, density: 0.00010, scale_min: 3.5, scale_max: 6.5, tile_rotation_dynamic: 0.5, shaded: true})),
		create_env_layer(merge(nebula_params, {parallax: 0.35, density: 0.00015, scale_min: 3, scale_max: 6, tile_rotation_dynamic: 0.25}))
	] 
	create_stage_volume([Asteroid, VolatileAsteroid, RedAsteroid, BeamDrone, EMPDrone, Drone, SuperDrone], 3000, infinity, 3000, 12, env_layers);
}

delayed_action(function() {global.alert_manager.queue_notification("YOU HAVE TO ENTER A PASSPHRASE ON YOUR KEYBOARD TO WARP! CAN YOU FIND IT?", critical_alert)}, 6.0);
delayed_action(function() {global.alert_manager.queue_notification("YOU NEED TO ENTER THE PASSPHRASE ON YOUR KEYBOARD TO WIN!", critical_alert)}, 36.0);