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

	// Data extraction point
	var x_margin = 1000;
	repeat(3) {
		randomize()
		instance_create_depth(x_margin + random(room_width - x_margin), 0.1 * room_height + random(0.8 * room_height), 0, DataExtractionPoint);
	}
}

