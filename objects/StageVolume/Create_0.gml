/// @description Insert description here
// You can write your code in this editor

// These are set by a script
objects = [];
env_layers = [];
vol_start = 0;
vol_end = 0;
vol_transition = 0;
density = 0;

// Initalizations
proximity = 0;
prev_proximity = 0;
entered = false;

function update_env_proximity(val) {
	for (var j = 0; j < array_length(self.env_layers); j += 1) {
		env_layer = self.env_layers[j];
		env_layer.proximity = val;
	}	
}

// Particles
//ps = part_system_create();
//em = part_emitter_create(ps);
//pt = part_type_create()
//part_type_color1(pt, c_lime);
//part_type_life(pt, 10 * room_speed, 10 * room_speed);
//part_type_size(pt, 10, 50, 1, 1);