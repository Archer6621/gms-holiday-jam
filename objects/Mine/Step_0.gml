/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (not in_shockwave) {
	var dts = 1 / game_get_speed(gamespeed_fps);
	var nearest_ship = instance_nearest_notthem(Ship, creator);
	if instance_exists(nearest_ship) {
		var dist = point_distance(x, y, nearest_ship.x, nearest_ship.y);
		var dir = point_direction(x, y, nearest_ship.x, nearest_ship.y);
	
		if (dist < guide_distance) {
			d_motion_add(dir, dts * acceleration_rate);
		}
	}

	if (d_speed > max_speed) {
		d_motion_add(direction + 180, dts * acceleration_rate);
	}
}