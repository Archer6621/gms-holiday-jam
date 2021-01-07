/// @description Insert description here
// You can write your code in this editor
var dts = 1 / room_speed;
speed = speed / (1 + dts * p_friction);

if (x > room_width + sprite_width or x < -sprite_width) {
	if (object_index != Hawk) {
		instance_destroy();
		exit;
	}
}

// collision map check
if (not ds_map_empty(collision_map)) {
	var current = ds_map_find_first(collision_map);
	while (current != undefined) {
		var next = ds_map_find_next(collision_map, current);
		if (not collision_map[? current]) {
			ds_map_delete(collision_map, current);
		} else {
			collision_map[? current] = false;
		}
		current = next;
	}
}

// border check
if (x < 0) {
	motion_add(0, 3);
	audio_play_sound_at(border_sound, x, y, 0, 1000, 0, 2, 0, 0);
	create_spark(c_aqua, x, y, 1, false);
}

if (x > room_width) {
	motion_add(180, 3);
	audio_play_sound_at(border_sound, x, y, 0, 1000, 0, 2, 0, 0);
	create_spark(c_aqua, x, y, 1, false);
}

// Ash particles
part_emitter_region(global.ps_top, ash_emitter, x-sprite_width/2, x+sprite_width/2, y-sprite_width/2, y+sprite_width/2, ps_shape_ellipse, ps_distr_invgaussian);
if (in_shockwave) {
	randomize();
	part_emitter_stream(global.ps_top, ash_emitter, global.ash_particle, -8);
	s_ambient = 0.25;
	s_lighting_intensity = 0.15;
}  else {
	part_emitter_stream(global.ps_top, ash_emitter, global.ash_particle, 0);
	s_lighting_intensity = 0.5;
	s_ambient = 0.75;
}

if (behaviour_disabled) {
	s_emission_strength = 0.1;	
} else {
	s_emission_strength = 1.0;	
}

prev_integrity = integrity;
if (in_shockwave) {
	integrity -= dts;
	if (vaporize_shockwave and object_index != Hawk) {
		instance_destroy();	
	}
}
if (integrity < 0 and not behaviour_disabled) {
	event_user(0);
	behaviour_disabled = true;	
}
if (integrity < critical_integrity * max_integrity and prev_integrity >= critical_integrity * max_integrity) {
	event_user(1);	
}
integrity = clamp(integrity, 0, max_integrity);
