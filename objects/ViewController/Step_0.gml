/// @description Insert description here
// You can write your code in this editor

if (instance_exists(global.hawk)) {
	
	audio_listener_position(global.hawk.x, global.hawk.y, 0);
	audio_listener_orientation(0,-1,0, 0,0,-1);
	audio_listener_velocity(global.hawk.hspeed, global.hawk.vspeed, 0.0);
}
	