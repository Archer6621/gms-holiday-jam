/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
engine_trail_particle = global.super_drone_engine_paticle;
initialize_sound(mine_layer_engine, 1);
create_following_light(id, c_purple, 100, 0.4);
image_xscale = 2;
image_yscale = image_xscale;
max_speed -= 0;


// Minelayer params
lay_direction = choose(0, 180);
lay_distance = 500;
max_mines = 3;
mines = [];

function closest_mine_in_proximity() {
	var min_inst = noone;
	var min_dist = room_height;
	for (var i = 0; i < array_length(mines); i += 1) {
		if (instance_exists(mines[i])) {
			var dist = point_distance(x, y, mines[i].x, mines[i].y);
			if (dist < min_dist and dist < lay_distance) {
				min_dist = dist;
				min_inst = mines[i];
			}
		}
	}
	return min_inst;
}

function lay_mine() {
	if (array_length(mines) >= max(1, max_mines)) {
		if (instance_exists(mines[0])) {
			instance_destroy(mines[0]);	
		}
		array_delete(mines, 0, 1);
	}
	var spawn_x = x - 1.5 * lengthdir_x(sprite_width, image_angle);
	var spawn_y = y - 1.5 * lengthdir_y(sprite_height, image_angle);
	var mine = instance_create_depth(spawn_x, spawn_y , 0, Mine);
	mine.creator = id;
	create_spark(c_fuchsia, spawn_x, spawn_y, 0.5, false); 
	audio_play_sound_at(mine_lay, x, y, 0, 1000, 0, 2, 0, 0);
	array_push(mines, mine);
}