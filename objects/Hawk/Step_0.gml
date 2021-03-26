/// @description Insert description here
// You can write your code in this editor


var dts = d(1) / game_get_speed(gamespeed_fps);

if (warping) {
	direction = 90;
	image_angle = 90;
	
	if (warp_speeding) {
	 d_speed += d(0.01);	
	} else {
	 d_speed = 0.9 * max_speed;	
	}
	if (in_shockwave) {
		integrity += dts;
	}
	exit;
}

event_inherited();

if (behaviour_disabled) {
	exit;	
}

if (in_shockwave) {
	var ds = global.game_manager.difficulty_scaling;
	integrity += (1 - ds) * dts;
}

if (global.upgrade_manager.flamethrower_ability.unlocked) {
	if (using_afterburner and global.frames % ceil(0.1 * game_get_speed(gamespeed_fps)) == 0) {
		create_projectile(x, y, AfterburnerBurn);
	}
}

if (do_forceblast) {
	if (consume_energy(1)) {
		create_projectile(x, y, ForceBlast);
		audio_play_sound(force_blast, 0, 0);
		if (global.upgrade_manager.mass_amplifier_ability.unlocked) {
			var temp = density;
			density = former_density;
			delayed_action(function(inst_id, val) {if (instance_exists(inst_id)){inst_id.density = val}}, 2.0, [id, temp]);
		}
	}
}

if (do_emp_blast) {
	var type = EMPExplosion
	var scale = 3;
	if (global.upgrade_manager.emp_screen_ability.unlocked) {
		type = EMPScreenExplosion;
		scale = 20;
	} 
	if (consume_energy(1.5)) {
		create_clustered_explosion(x, y, scale * image_xscale, 0, 0.6, type, [c_aqua, c_blue]);
		create_decaying_light(x, y, c_white,  c_aqua, 1000, 2, 10)
		audio_play_sound_at(explosion_emp, x, y, 0, 1000, 0, 2, 0, 0);
		audio_play_sound_at(force_blast, x, y, 0, 1000, 0, 2, 0, 0);
	}
	
}

if (integrity > critical_integrity * max_integrity) {
	follow_light.light_color = c_green;
	if (audio_exists(critical_integrity_sound)) {
		audio_stop_sound(critical_integrity_sound);
	}
} else {
	follow_light.light_color = c_red;
	if (not audio_is_playing(critical_integrity_sound)) {
		critical_integrity_sound = audio_play_sound(critical_alert, 1, 1);	
	}
}


if (global.upgrade_manager.hull_repair_ability.unlocked) {
	if (not in_shockwave) {
		integrity += 0.5 * dts;	
	}
}

if (global.upgrade_manager.shock_wave_charge_ability.unlocked) {
	if (in_shockwave) {
		reactor_charge += reactor_charge_rate * dts;		
	}
}

if (global.upgrade_manager.shock_wave_immunity_ability.unlocked) {
	if (in_shockwave) {
		integrity += dts;
	}
}



// Too spammy
//if (prev_integrity < max_integrity and integrity >= max_integrity) {
//	global.alert_manager.announce(snd_voice_ship_repaired);
//}

