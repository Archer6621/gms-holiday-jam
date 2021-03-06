/// @description Insert description here
// You can write your code in this editor


// Find Hawk and spawn stuff ahead
if (not instance_exists(global.hawk)) {
	exit;	
}

var inv_y = room_height - global.hawk.y

prev_proximity = proximity;
proximity = transition(inv_y, vol_start, vol_end, vol_transition);

if (proximity < 0.0001) {
	update_env_proximity(0);
	exit;	
} 

ymin = inv_y + view_hport[0];
ymax = ymin + view_hport[0];
count = 0;
for (var i = 0; i < array_length(self.objects); i += 1) {
	with (self.objects[i]) {
		var inv_y = room_height - y;
		if (inv_y > other.ymin and inv_y < other.ymax) {
			other.count += 1;	
		}
	}
	var ds = global.game_manager.difficulty_scaling;
	randomize()
	if (proximity >= random(2) and self.count < ds * self.density) {
		randomize();
		var spawn_x = random(room_width);
		randomize();
		var spawn_y = room_height - (ymin + random(ymax - ymin));
		// Check if anything spawned nearby
		var inst = instance_nearest(spawn_x, spawn_y, Rigidbody);
		if (instance_exists(inst)) {
			if (point_distance(inst.x, inst.y, spawn_x, spawn_y) < 2 * max(inst.sprite_width, inst.sprite_height)) {
				continue;
			}
		}
		
		instance_create_layer(spawn_x, spawn_y, "Instances", self.objects[i]);
	}
}


update_env_proximity(proximity);

// Trigger stuff upon entering
if (prev_proximity < 0.0001 and proximity >= 0.0001 and not entered) {
	for (var i = 0; i < array_length(objects); i += 1) {
		if (object_is_ancestor(objects[i], Drone) or objects[i]==Drone) {
			global.alert_manager.queue_notification("INCOMING DRONES!", alert_1, snd_voice_incoming_drones);
			break;
		}
		
		if (object_is_ancestor(objects[i], MineLayer) or objects[i]==MineLayer or objects[i]==Mine) {
			global.alert_manager.queue_notification("MINES AHEAD!", alert_1, snd_voice_mines_ahead);
			break;
		}
	}
}

entered = true;