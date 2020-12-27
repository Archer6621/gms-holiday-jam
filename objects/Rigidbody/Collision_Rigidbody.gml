/// @description Insert description here
// You can write your code in this editor

if (not ds_map_exists(collision_map, other.id)) {
	col_dir = direction;
	var rel_hspeed = other.hspeed - hspeed;
	var rel_vspeed = other.vspeed - vspeed;
	var norm_x = self.x - other.x;
	var norm_y = self.y - other.y;
	var factor = dot_product_normalized(rel_hspeed, rel_vspeed, norm_x, norm_y);
	rel_speed = point_distance(0, 0, rel_hspeed, rel_vspeed);
	bounce_dir = point_direction(0, 0, norm_x, norm_y);
	
	var mass = get_mass();
	var total_mass = mass + other.get_mass();
	ratio = mass / total_mass;

	motion_add(bounce_dir, elasticity * factor * (1 - ratio) * rel_speed);
	
} 
move_outside_all(bounce_dir, rel_speed);
collision_map[? other.id] = true;