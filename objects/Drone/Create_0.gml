/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
engine_trail_particle = global.drone_engine_paticle;
initialize_sound(drone_engine, 1 + random(2));
light = create_following_light(id, c_red, 50, 0.5);
max_speed += 1;
max_integrity = 0.1;
integrity = max_integrity;
density = 0.25;
reactor_charge_rate = 0;
reactor_capacity = 30;
reactor_charge =reactor_capacity;


// Drone params
proximity_threshold = 10;
proximity_compensation = 200;