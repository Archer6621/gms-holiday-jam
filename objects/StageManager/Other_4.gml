/// @description Insert description here
// You can write your code in this editor

if (array_contains(global.levels, room)) {
	// Hawk
	instance_create_layer(room_width/2, room_height - 100, "Instances", Hawk);
	instance_create(SuperNova);
	instance_create(WarpZone);

	// Camera
	zoom = 1.0;
	camera_set_view_size(view_camera[0], view_wport[0] * zoom, view_hport[0] * zoom)
	instance_create(ViewController);

	// Base background
	create_env_layer([spr_star_s, spr_star_m, spr_star_l], 0.01, 0.00015, 1, 1, 0, 0, 180, 0, c_white, 0, 0, true);
	create_env_layer([spr_dust], 0.85,  0.00001, 0.1, 0.6, 0.4, 360, 360, 0, c_white, 0, 0, true);
}

