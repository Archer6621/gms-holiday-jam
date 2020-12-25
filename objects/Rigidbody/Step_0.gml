/// @description Insert description here
// You can write your code in this editor
var dts = 1 / room_speed;
speed = speed / (1 + dts * p_friction);

if (x > room_width + sprite_width or x < -sprite_width) {
	if (object_index != Hawk) {
		instance_destroy();	
	}
}