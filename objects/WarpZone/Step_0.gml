/// @description Insert description here
// You can write your code in this editor



if (instance_exists(global.hawk)) {
	if (global.endless) {
		if (string_count("supernova", string_lower(keyboard_string)) == 0) {
			y = global.hawk.y - 1;
		} else {
			global.manager.won = true;	
		}
	}
	if (all_true(warp_conditions, exec)) {
		alarm_set(0, 6 * room_speed);
		audio_play_sound_at(warp_hit, global.hawk.x, global.hawk.y, 0, 10000, 0, 2, 0, 0);
		global.alert_manager.announce(snd_voice_warp_initiated);
		
		// Save integrity
		global.persistent_integrity = max(global.hawk.integrity, global.hawk.max_integrity * global.hawk.critical_integrity);
			
		// Warp
		global.hawk.reactor_charge = 0;
		global.hawk.warping = true;
		global.hawk.warp_speeding = true;
		
		// Add credits based on ahead-ness
		if (global.hawk.in_shockwave) {
			global.upgrade_manager.upgrade_credits += 0;	// Maybe on easy difficulty grant a point anyway
		} else {
			global.upgrade_manager.upgrade_credits += 1;
		}
		
	} else if (all_true(in_area, exec) and not arrived) {
		arrived = true;
		global.alert_manager.announce(snd_voice_warp_insufficient_energy);
		
	}
}

if (proximity_checker.p_enter_y()) {
	global.alert_manager.queue_notification("APPROACHING WARPZONE", alert_1, snd_voice_approaching_warpzone);
}