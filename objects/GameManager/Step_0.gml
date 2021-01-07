/// @description Insert description here
// You can write your code in this editor

global.hawk = instance_find(Hawk, 0);
if (instance_exists(global.hawk) and global.persistent_integrity < 0) {
	global.persistent_integrity = global.hawk.max_integrity;
	global.hawk.integrity = global.persistent_integrity;
	hawk_max_integrity = global.hawk.max_integrity;
}
global.dts = 1 / room_speed;