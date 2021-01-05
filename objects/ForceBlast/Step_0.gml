/// @description Insert description here
// You can write your code in this editor
direction = image_angle;
speed /= 1.001;
push_force = power(speed, 2) / 50;
image_xscale /= 1.01;
image_alpha /= 1.01;
if (image_alpha < 0.01) {
	instance_destroy();	
}