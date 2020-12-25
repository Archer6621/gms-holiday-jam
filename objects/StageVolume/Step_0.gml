/// @description Insert description here
// You can write your code in this editor

// Find Hawk and spawn stuff ahead
var hawk = instance_find(Hawk, 0);
var inv_y = room_height - hawk.y

proximity = transition(inv_y, vol_start, vol_end, vol_transition);

if (proximity < 0.01) {
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
	//show_debug_message(self.count)
	if (proximity >= random(1) and self.count < self.density) {
		var spawn_x = random(room_width);
		instance_create_layer(spawn_x, room_height - (ymin + random(ymax - ymin)), "Instances", self.objects[i]);
	}
}


for (var j = 0; j < array_length(self.env_layers); j += 1) {
	env_layer = self.env_layers[j];
	env_layer.proximity = self.proximity;
}

// Particles
//var dts = delta_time / 1000000;
//part_emitter_region(ps, em, 0, room_width, hawk.y - view_hport[0], hawk.y - view_hport[0], ps_shape_line, ps_distr_linear);
//part_emitter_burst(ps, em, pt, density * proximity);