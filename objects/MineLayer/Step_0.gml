/// @description Insert description here
// You can write your code in this editor

// Manage controls
if (not behaviour_disabled) {
var mine_inst = closest_mine_in_proximity();
	var deviation = angle_difference(image_angle, lay_direction);
	if (instance_exists(mine_inst)) {
		if (deviation < 0) {
			go_left = 1;	
		}
		if (deviation > 0) {
			go_right = 1;	
		}
		go_forward = 1;
	} else {
		lay_mine();
	}

	if (x < 100) {
		lay_direction = 0;	
	}
	if (x > room_width - 100) {
		lay_direction = 180;	
	}
}
event_inherited();

