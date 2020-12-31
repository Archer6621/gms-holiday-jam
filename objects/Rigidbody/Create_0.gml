/// @description Insert description here
// You can write your code in this editor
event_inherited();

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
rel_hspeed = 0;
rel_vspeed = 0;
in_shockwave = false;
behaviour_disabled = false;
ash_emitter = part_emitter_create(global.ps_top);


function get_mass() {
	return image_xscale * image_yscale * density;	
}
