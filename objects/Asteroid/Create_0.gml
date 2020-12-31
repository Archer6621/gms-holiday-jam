/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Constants
rotation_speed = 10 + random(20);

// Physics
density = 2;
elasticity = 1.0;
p_friction = 0.000001;

// Initializations
image_angle = random(360);
image_xscale = 0.5 + random(3);
image_yscale = image_xscale;

// Lighting
normal_strength_scale = 0.5;
emission_strength_scale = 0.0;

// Initial motion
motion_add(random(360), random(0.5));