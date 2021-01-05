/// @description Insert description here
// You can write your code in this editor
if (instance_exists(global.hawk)) {
	if (all_true(warp_conditions, exec)) {
		alarm_set(0, 6 * room_speed);
		audio_play_sound_at(warp_hit, global.hawk.x, global.hawk.y, 0, 10000, 0, 2, 0, 0);
		global.alert_manager.announce(snd_voice_warp_initiated);
		
		// Save integrity
		global.persistent_integrity = global.hawk.integrity;
			
		// Warp
		global.hawk.reactor_charge = 0;
		global.hawk.warping = true;
		
		// Add credits based on ahead-ness
		if (global.hawk.in_shockwave) {
			global.upgrade_manager.upgrade_credits += 1;	
		} else {
			global.upgrade_manager.upgrade_credits += 2;
		}
		
	} else if (all_true(in_area, exec) and not arrived) {
		arrived = true;
		global.alert_manager.announce(snd_voice_warp_insufficient_energy);
		
	}
}

if (proximity_checker.p_enter_y()) {
	global.alert_manager.queue_notification("APPROACHING WARPZONE", alert_1, snd_voice_approaching_warpzone);
}