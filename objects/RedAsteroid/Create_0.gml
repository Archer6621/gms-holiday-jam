/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Constants
rotation_speed = 10 + random(20);

// Initializations
image_angle = random(360);
image_xscale = 1;
image_yscale = image_xscale;

// Physics
density = 5;
elasticity = 0.8;
p_friction = 0.000001;


// Initial motion
//motion_add(random(360), random(0.1));