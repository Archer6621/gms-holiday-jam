/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
initialize_sound(drone_engine, 1 + random(2));
create_following_light(id, c_red, 50, 0.5);

max_speed += 1;


// Drone params
proximity_threshold = 10;
proximity_compensation = 200;