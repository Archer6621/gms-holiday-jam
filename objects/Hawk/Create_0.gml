/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
initialize_sound(hawk_engine, 1.5);

// Override
knock_out = function(amount) {	
	if (alarm_ready(0)) {
		var rounded  = ceil(amount * knockout_speed) / knockout_speed;
		alarm_set(0, room_speed * rounded);
		var bar = create_bar(id, function(inst_id) {return inst_id.alarm[0]}, 0, room_speed * rounded, 0, 50, 50, 10, c_aqua, true, false);
		delayed_action(function(inst_id) {instance_destroy(inst_id)}, rounded, [bar]);
	}
}


image_xscale = 1.25;
image_yscale = image_xscale;

create_following_light(id, c_green, 100, 0.5, 0, 0.25 * sprite_height);

