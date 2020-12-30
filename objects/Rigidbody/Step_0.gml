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

if (behaviour_disabled) {
	exit;	
}