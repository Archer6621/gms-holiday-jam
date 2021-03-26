// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function d_motion_add(angle, amount) {
	d_hspeed += lengthdir_x(amount, angle);
    d_vspeed += lengthdir_y(amount, angle);
}
