audio_stop_all();
// Music
audio_play_sound(music_1,0,1);


instance_create(MenuBG);

create_env_layer({
	sprites: [spr_star_s, spr_star_m, spr_star_l], 
	parallax: 0.01, 
	density: 0.00055, 
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

create_env_layer({
	sprites: [spr_nebula], 
	parallax: 0.2, 
	density: 0.000035,
	scale_min: 2,
	scale_max: 5,
	scale_desync: 1,
	tile_rotation_dynamic: 1,
	depth_color: c_navy,
	shaded: true
});

create_env_layer({
	sprites: [spr_nebula], 
	parallax: 0.3, 
	density: 0.000025,
	scale_min: 3,
	scale_max: 7,
	scale_desync: 2,
	tile_rotation_dynamic: 2,
	depth_color: c_navy,
	shaded: true
});