/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
engine_trail_particle = global.drone_engine_paticle;
initialize_sound(drone_engine, 1 + random(2));
light = create_following_light(id, c_red, 50, 0.5);
var ds = global.game_manager.difficulty_scaling;
max_speed += power(ds, 0.25) * 1;
max_integrity = 0.1;
integrity = max_integrity;
density = power(ds, 0.5) * 0.29;
reactor_charge_rate = 0;
reactor_capacity = 30;
reactor_charge =reactor_capacity;
deviation = 0;
distance = 0;

// Drone params
proximity_threshold = 10;
proximity_compensation = 200;