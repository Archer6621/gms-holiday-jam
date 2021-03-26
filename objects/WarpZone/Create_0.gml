/// @description Insert description here
// You can write your code in this editor
event_inherited();
print(alarm[0], d_alarm[0]);


y = 1000;
if (instance_exists(global.hawk)) {
	if (global.endless) {
		y = global.hawk.y - 1;
	}
}
proximity_checker =  create_proximity_checker(Hawk, 3000);

keyboard_string = "";

// Warp conditions
cond_in_area = function() {return global.hawk.y < y}
cond_reactor_charged = function() {
	var ds = global.game_manager.difficulty_scaling;
	// Another idea: only wait if in cooldown
	return global.hawk.reactor_charge >= ds * 0.1 * global.hawk.reactor_capacity}
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

