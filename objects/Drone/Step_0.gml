/// @description Insert description here
// You can write your code in this editor

var dts = 1 / game_get_speed(gamespeed_fps);
// Manage controls
if (instance_exists(global.hawk) and not behaviour_disabled) {
	if (consume_energy(dts)) {

		var lead_x = global.hawk.x;
		var lead_y = global.hawk.y;
		var drone = instance_nearest_notme(Drone);

		if (drone != noone) {
			if (abs(x - drone.x) < proximity_threshold * sprite_width) {
				if (abs(drone.x - x) > 0) {
					lead_x -= proximity_compensation * sprite_width / (drone.x - x);
				}
			}
		}

		deviation = angle_difference(image_angle, point_direction(x, y, lead_x, lead_y));
		distance = point_distance(x, y, global.hawk.x, global.hawk.y)

		if (deviation < 0) {
			go_left = 1;	
		}
		if (deviation > 0) {
			go_right = 1;	
		}
		go_forward = 1;
	} else {
		behaviour_disabled = true;	
	}
	
}
// Inherit the parent event
event_inherited();

