/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
engine_trail_particle = global.beam_drone_engine_particle;
instance_destroy(light);
light = create_following_light(id, c_orange, 100, 1.0);
max_integrity = 0.1;
integrity = max_integrity;


// Drone params
proximity_threshold = 10;
proximity_compensation = 200;

