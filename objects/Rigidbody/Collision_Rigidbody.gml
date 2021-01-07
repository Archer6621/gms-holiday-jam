/// @description Insert description here
// You can write your code in this editor

// Ignore warping
if (other.object_index==Hawk) {
	if (other.warping) {
		exit;	
	}
}

if (not ds_map_exists(collision_map, other.id)) {
	audio_play_sound_at(col_1, x, y, 0, 1000, 0, 2, 0, 0);
	rel_hspeed = other.hspeed - self.hspeed;
	rel_vspeed = other.vspeed - self.vspeed;
	var norm_x = self.x - other.x;
	var norm_y = self.y - other.y;
	factor = dot_product_normalized(rel_hspeed, rel_vspeed, norm_x, norm_y);
	
	if (factor > 0) {
		rel_speed = point_distance(0, 0, rel_hspeed, rel_vspeed);
		bounce_dir = point_direction(0, 0, norm_x, norm_y);
	
		var mass = get_mass();
		var total_mass = mass + other.get_mass();
		ratio = mass / total_mass;

		// We have to resolve the entire collision here, because otherwise the collision will behave differently
		// depending on the order of resolution
		if (not stationary) {
			motion_add(bounce_dir, elasticity * factor * (1 - ratio) * rel_speed);
		}	
		with (other) {
			// Set all the variables correctly for debugging purposes
			factor = other.factor;
			ratio = other.ratio;
			rel_speed = other.rel_speed;
			rel_hspeed = -other.rel_hspeed;
			rel_vspeed = -other.rel_vspeed;
			bounce_dir = other.bounce_dir + 180;
			if (not stationary) {
				motion_add(self.bounce_dir, self.elasticity * self.factor * self.ratio * self.rel_speed);
			}
			
			// Need this check: it's possible for the other object to have destroyed its map already
			if (ds_exists(collision_map, ds_type_map)) {
				collision_map[? other.id] = true;
			}
		}
	}
} 
if (not stationary) {
	move_outside_all(bounce_dir, rel_speed);
	motion_add(bounce_dir, 1 / room_speed);
}
collision_map[? other.id] = true;
