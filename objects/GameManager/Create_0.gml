/// @description Insert description here
// You can write your code in this editor

global.game_manager = self.id;
global.frames = 0;
global.hawk = noone;
global.dts = 1 / room_speed;
global.levels = [level_1, level_2, level_3, level_4];
global.current_level = -1;
global.ui_alpha = 0.95;
global.draw_one = true;
global.persistent_integrity = -1;
global.double_tap_time = 0.2;
hawk_max_integrity = -1;

function go_to_next_level() {
	global.current_level += 1;
	print("Going to level:", room_get_name(global.levels[global.current_level]));
	global.room_manager.room_goto_transition(global.levels[global.current_level]);
}

// Particle Management
global.ps = part_system_create();
global.ps_add = part_system_create();
global.ps_top = part_system_create();
part_system_automatic_draw(global.ps, false);
part_system_automatic_draw(global.ps_add, false);
part_system_automatic_draw(global.ps_top, false);
part_system_depth(global.ps_top, -10);

global.default_engine_paticle = part_type_create();
part_type_shape(global.default_engine_paticle, pt_shape_flare);
part_type_size(global.default_engine_paticle, 0.2, 0.2, -0.01, 0.1);
part_type_alpha2(global.default_engine_paticle, 1.0, 0.0);
part_type_color1(global.default_engine_paticle, c_gray);
part_type_life(global.default_engine_paticle, 0.5 * room_speed, 1 * room_speed);
part_type_blend(global.default_engine_paticle, true);

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

global.burst_particle = part_type_create();
part_type_shape(global.burst_particle, pt_shape_ring);
part_type_size(global.burst_particle, 0.01, 0.8, -0.001, 0.0);
part_type_direction(global.burst_particle, 0, 360, 0.0, 0.0);
part_type_speed(global.burst_particle, 0.1, 7.0, -0.001, 0.0);
part_type_orientation(global.burst_particle, 0, 360, 0.0, 0.0, false);
part_type_alpha2(global.burst_particle, 1.0, 0.0);
part_type_color3(global.burst_particle, c_white, c_yellow, c_green);
part_type_life(global.burst_particle, 0.2 * room_speed, 0.5 * room_speed);
part_type_blend(global.burst_particle, true)

global.drone_engine_paticle = part_type_create();
part_type_shape(global.drone_engine_paticle , pt_shape_flare);
part_type_size(global.drone_engine_paticle , 0.4, 0.4, -0.01, 0.0);
part_type_alpha2(global.drone_engine_paticle , 1.0, 0.0);
part_type_color2(global.drone_engine_paticle ,  c_red, c_maroon);
part_type_life(global.drone_engine_paticle , 0.5 * room_speed, 1 * room_speed);

global.super_drone_engine_paticle = part_type_create();
part_type_shape(global.super_drone_engine_paticle , pt_shape_flare);
part_type_size(global.super_drone_engine_paticle , 0.5, 0.5, -0.01, 0.0);
part_type_alpha2(global.super_drone_engine_paticle , 1.0, 0.0);
part_type_color2(global.super_drone_engine_paticle ,  c_fuchsia, c_purple);
part_type_life(global.super_drone_engine_paticle , 0.5 * room_speed, 1 * room_speed);

global.emp_drone_engine_particle = part_type_create();
part_type_shape(global.emp_drone_engine_particle , pt_shape_flare);
part_type_size(global.emp_drone_engine_particle , 0.5, 0.5, -0.01, 0.0);
part_type_alpha2(global.emp_drone_engine_particle , 1.0, 0.0);
part_type_color2(global.emp_drone_engine_particle ,  c_aqua, c_purple);
part_type_life(global.emp_drone_engine_particle , 0.5 * room_speed, 1 * room_speed);

global.ash_particle = part_type_create();
part_type_shape(global.ash_particle, pt_shape_flare);
part_type_size(global.ash_particle, 0.05, 0.08, -0.0006, 0.0);
part_type_orientation(global.ash_particle, 0, 360, 5, 0.0, false);
part_type_alpha3(global.ash_particle, 1.0, 0.8, 0.3);
part_type_color3(global.ash_particle, c_orange, c_orange,  c_grey);
part_type_life(global.ash_particle, 0.5 * room_speed, 1 * room_speed);
part_type_blend(global.ash_particle, false);