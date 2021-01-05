/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

ability = undefined;

state = function() {
	return is_undefined(ability) ? false : ability.unlocked;
}

active = function() {
	var cond = global.upgrade_manager.upgrade_credits > 0;
	if (not is_undefined(ability)) {
		cond = cond and ability.discovered;
		if (not is_undefined(ability.dependency)) {
			cond = cond and ability.dependency.unlocked;
		}
		if (not is_undefined(ability.restrict)) {
			cond = cond and not ability.restrict.unlocked;
		}
		cond = cond or ability.unlocked;
	} else {
		cond = false;	
	}
	return cond;
}

clickable = function() {
	if (not is_undefined(ability)) {
		return not ability.unlocked and active();	
	}
	return false;
}


func = function() {
	if (active()) {
		global.upgrade_manager.unlock(ability);
		global.alert_manager.announce(snd_voice_tech_unlocked);
	} else {
		audio_play_sound(alert_2, 0, 0);	
	}
}

on_hover = function() {
	with (Description) {
		if (not is_undefined(other.ability)) {
			text = 	other.ability.description;
		}
	}
}


function set_ability(ability) {
	self.ability = ability;
	enabled = state();
	prev_enabled = enabled;
}
