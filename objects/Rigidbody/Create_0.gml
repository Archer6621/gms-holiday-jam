/// @description Insert description here
// You can write your code in this editor

// Properties
density = 1;
elasticity = 1;
p_friction = 0.1;

function get_mass() {
	return image_xscale * image_yscale * density;	
}
