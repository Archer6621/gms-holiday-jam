/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Constants
rotation_speed = 10 + random(20);

// Initializations
image_angle = random(360);
image_xscale = 1;
image_yscale = image_xscale;
image_blend = merge_colour(c_maroon, c_white, 0.25);

// Physics
density = 500;
elasticity = 1.0;
p_friction = 0.000001;


// Initial motion
//d_motion_add(random(360), random(0.1));