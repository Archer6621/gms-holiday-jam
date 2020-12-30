/// @description Insert description here
// You can write your code in this editor

global.game_manager = self.id;
global.frames = 0;
global.hawk = noone;
global.dts = 1 / room_speed;


audio_play_sound(music_1,0,1);


// Particle Management
global.ps = part_system_create();

global.default_engine_paticle = part_type_create();
part_type_shape(global.default_engine_paticle, pt_shape_flare);
part_type_size(global.default_engine_paticle, 0.2, 0.2, -0.01, 0.1);
part_type_alpha2(global.default_engine_paticle, 1.0, 0.0);
part_type_color1(global.default_engine_paticle, c_gray);
part_type_life(global.default_engine_paticle, 0.5 * room_speed, 1 * room_speed);
part_type_blend(global.default_engine_paticle, true)

global.hawk_engine_paticle = part_type_create();
part_type_shape(global.hawk_engine_paticle, pt_shape_flare);
part_type_size(global.hawk_engine_paticle, 0.4, 0.4, -0.01, 0.0);
part_type_alpha2(global.hawk_engine_paticle, 1.0, 0.0);
part_type_color2(global.hawk_engine_paticle, c_yellow, c_lime);
part_type_life(global.hawk_engine_paticle, 0.5 * room_speed, 1 * room_speed);

global.afterburner_particle = part_type_create();
part_type_shape(global.afterburner_particle, pt_shape_flare);
part_type_size(global.afterburner_particle, 0.7, 0.7, -0.005, 0.0);
part_type_orientation(global.afterburner_particle, 0, 360, 0.0, 0.0, false);
part_type_alpha2(global.afterburner_particle, 1.0, 0.0);
part_type_color2(global.afterburner_particle, c_orange, c_orange);
part_type_life(global.afterburner_particle, 1.0 * room_speed, 2.0 * room_speed);
part_type_blend(global.afterburner_particle, true)

global.drone_engine_paticle = part_type_create();
part_type_shape(global.drone_engine_paticle , pt_shape_flare);
part_type_size(global.drone_engine_paticle , 0.4, 0.4, -0.01, 0.0);
part_type_alpha2(global.drone_engine_paticle , 1.0, 0.0);
part_type_color2(global.drone_engine_paticle ,  c_red, c_maroon);
part_type_life(global.drone_engine_paticle , 0.5 * room_speed, 1 * room_speed);
