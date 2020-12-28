// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Takes into account rigidbody mass
function motion_add_m(dir, amount){
	motion_add(dir, amount / get_mass());
}