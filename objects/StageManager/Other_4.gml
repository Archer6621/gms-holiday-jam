/// @description Insert description here
// You can write your code in this editor

if (array_contains(global.levels, room)) {
	// Hawk
	var hawk = instance_create_layer(room_width/2, room_height + 100, "Instances", Hawk);
	// bit too much, and blocks critical hull notif
	// global.alert_manager.announce(snd_voice_disengaging);
	hawk.warping = true;
	delayed_action(function(inst_id) {
		if (instance_exists(inst_id)){
			inst_id.warping = false
			audio_play_sound(power_loss, 0, 0);
			global.alert_manager.queue_notification("WARNING, INCOMING SUPERNOVA", alert_1, snd_voice_incoming_supernova)
		}
	}, 2.0, [hawk]);
	instance_create(SuperNova);
	instance_create_ui(WarpZone); // Have it on the foreground
	
	// Camera
	zoom = 1.0;
	camera_set_view_size(view_camera[0], view_wport[0] * zoom, view_hport[0] * zoom)
	instance_create(ViewController);

	// Data extraction point
	var x_margin = 1000;

	if (not global.endless) {
		randomize()
		var spawn_x = x_margin + random(room_width - x_margin);
		randomize();
		var spawn_y = 0.1 * room_height + random(0.7 * room_height);
		instance_create_depth(spawn_x, spawn_y, 0, DataExtractionPoint);
		repeat(2) {
			var nearest = instance_nearest(spawn_x, spawn_y, DataExtractionPoint);
			var tries = 0;
			while (point_distance(spawn_x, spawn_y, nearest.x, nearest.y) < 5000) {
				randomize();
				spawn_x = x_margin + random(room_width - x_margin);
				randomize();
				spawn_y = 0.1 * room_height + random(0.8 * room_height);
				tries += 1;
				if (tries > 8) {
					break;	
				}
			}
			instance_create_depth(spawn_x, spawn_y, 0, DataExtractionPoint);
		}
	}
	// Undiscover core abilities that were discovered but not unlocked
	var abilities = global.upgrade_manager.core_abilities;
	for (var i = 0; i < array_length(abilities); i++) {
		if (abilities[i].discovered and not abilities[i].unlocked) {
			abilities[i].discovered = false;
		}
	}
	
	// Reset available credits
	global.upgrade_manager.upgrade_credits = 0;
	
	// UIs
	instance_create_ui(Upgrades);
}

