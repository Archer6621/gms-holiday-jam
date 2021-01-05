/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
engine_trail_particle = global.super_drone_engine_paticle;
instance_destroy(light);
light = create_following_light(id, c_fuchsia, 100, 0.5);
max_integrity = 4;
integrity = max_integrity;


// Drone params
proximity_threshold = 10;
proximity_compensation = 200;

