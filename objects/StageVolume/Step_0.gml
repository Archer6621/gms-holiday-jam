/// @description Insert description here
// You can write your code in this editor

// Find Hawk and spawn stuff ahead

if (not instance_exists(global.hawk)) {
	exit;	
}

var inv_y = room_height - global.hawk.y

proximity = transition(inv_y, vol_start, vol_end, vol_transition);

if (proximity < 0.0001) {
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

	if (proximity >= random(1) and self.count < self.density) {
		var spawn_x = random(room_width);
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


for (var j = 0; j < array_length(self.env_layers); j += 1) {
	env_layer = self.env_layers[j];
	env_layer.proximity = self.proximity;
}