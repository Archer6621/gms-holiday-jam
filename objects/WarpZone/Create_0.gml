/// @description Insert description here
// You can write your code in this editor
y = 1000;
proximity_checker =  create_proximity_checker(Hawk, 3000);

// Warp conditions
cond_in_area = function() {return global.hawk.y < y}
cond_reactor_charged = function() {return global.hawk.reactor_charge >= 0.5 * global.hawk.reactor_capacity}
cond_not_warping = function() {return not global.hawk.warping}

warp_conditions = [
	cond_in_area,
	cond_reactor_charged,
	cond_not_warping
]

in_area = [
	cond_in_area,
	cond_not_warping
]

arrived = false;

