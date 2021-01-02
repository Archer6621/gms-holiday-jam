/// @description Insert description here
// You can write your code in this editor

if (instance_exists(following)) {
	x = following.x + offset_x;
	y = following.y + offset_y;
} else {
	instance_destroy();
}