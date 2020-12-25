/// @description Insert description here
// You can write your code in this editor

// Manage controls
var hawk = instance_find(Hawk, 0);

var lead_x = hawk.x;
var lead_y = hawk.y;
var drone = instance_nearest_notme(Drone);

if (drone != noone) {
	if (abs(x - drone.x) < proximity_threshold * sprite_width) {
		if (abs(drone.x - x) > 0) {
			lead_x -= proximity_compensation * sprite_width / (drone.x - x);
		}
	}
}

//if (abs(y - drone.y) < proximity_threshold * sprite_height) {
//	if (abs(drone.y - y) > 0) {
//		lead_y += proximity_compensation * sprite_width / (drone.y - y);
//	}
//}


var deviation = angle_difference(image_angle, point_direction(x, y, lead_x, lead_y));



if (deviation < 0) {
	go_left = 1;	
}
if (deviation > 0) {
	go_right = 1;	
}



go_forward = 1;



// Inherit the parent event
event_inherited();

