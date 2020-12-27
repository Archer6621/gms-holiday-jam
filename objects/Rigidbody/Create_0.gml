/// @description Insert description here
// You can write your code in this editor

// data structures
collision_map = ds_map_create();

// Properties
density = 1;
elasticity = 1;
p_friction = 0.1;

// Initializations
bounce_normal = 0;
bounce_dir = 0;
col_dir = 0;
rel_speed = 0;

function get_mass() {
	return image_xscale * image_yscale * density;	
}
