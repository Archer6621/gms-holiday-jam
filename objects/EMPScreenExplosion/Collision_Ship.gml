/// @description Insert description here
// You can write your code in this editor

if (other.emp_immune) {
	exit;
}

if (collision_map[? other.id] == undefined) {
	with (other) {
		var temp = reactor_charge_rate;
		reactor_charge_rate = 0;
		delayed_action(function(inst_id, val) {if (instance_exists(inst_id)){inst_id.reactor_charge_rate = val}}, 3, [id, temp]);	
	}
}

event_inherited();

// TODO: implement dts
with (other) {
	reactor_charge *= 0.9;
}
