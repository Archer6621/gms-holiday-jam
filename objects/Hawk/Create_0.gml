/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
malfunction_sound = noone;
death_malfunction_sound = noone;
critical_integrity_sound = noone;
initialize_sound(hawk_engine, 1.5);
max_integrity = 30;
integrity = global.persistent_integrity==-1 ? max_integrity : global.persistent_integrity;
prev_integrity = integrity;
if (integrity < critical_integrity * max_integrity) {
	event_user(1);	 // DOESN'T FIRE???
}
warping = false;
warp_speeding = false;
former_density = density;

// Inputs
do_forceblast = false;
do_burst = false;
use_afterburner = false;
do_emp_blast = false;

var ds = global.game_manager.difficulty_scaling;
knockout_speed /= ds

if (global.upgrade_manager.mass_amplifier_ability.unlocked) {
	density = former_density * 100;	
}

if (global.upgrade_manager.knockout_immunity_ability.unlocked) {
	knockout_factor = 0.25;	
}

if (global.upgrade_manager.emp_immunity_ability.unlocked) {
	emp_immune = true;
}

// Override
knock_out = function(amount) {	
	if (alarm_ready(0)) {
		var rounded  = ceil(knockout_factor * amount * knockout_speed) / knockout_speed;
		d_alarm_set(0, game_get_speed(gamespeed_fps) * rounded);
		var bar = create_bar(id, 
		function(inst_id) {return inst_id.alarm[0]}, 
		function(inst_id) {return 0},
		0, game_get_speed(gamespeed_fps) * rounded, 0, 35, 50, 10, [c_aqua], true, false,
		new Label("MALFUNCTION", true));
		malfunction_sound = audio_play_sound(malfunction, 0, 1);
		delayed_action(function(inst_id) {if (instance_exists(inst_id)){instance_destroy(inst_id)}}, rounded, [bar]);
	}
}

image_xscale = 1.25;
image_yscale = image_xscale;

follow_light = create_following_light(id, c_green, 100, 0.5, 0, 0.25 * sprite_height);

create_bar(id, 
	function(inst_id) {return inst_id.reactor_charge},
	function(inst_id) {return inst_id.reactor_overheated}, 
0, reactor_capacity, 0.75 * display_get_gui_width(), display_get_gui_height() - 50, 100, 15, [c_yellow, merge_colour(c_blue, c_aqua, 0.5)], false, false,
new Label("REACTOR", false));

create_bar(id, 
	function(inst_id) {return inst_id.integrity},
	function(inst_id) {return inst_id.integrity < inst_id.critical_integrity * inst_id.max_integrity}, 
0, max_integrity, 0.75 * display_get_gui_width(), display_get_gui_height() - 30, 100, 15, [c_aqua, c_red], false, false,
new Label("HULL INTEGRITY", false));