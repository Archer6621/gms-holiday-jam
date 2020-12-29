/// @description Insert description here
// You can write your code in this editor

y -= supernova_speed / room_speed;

with (Rigidbody) {
	if (y > other.y) {
		if (not behaviour_disabled)
		{
			behaviour_disabled = true;
			create_spark(x, y, 0.5 * image_xscale, true);
			audio_play_sound_at(choose(wave_hit, wave_hit_2), x, y, 0, 1000, 0, 2, 0, 0);
			motion_add(90 + random(45) - random(45), random(2));
			image_angle = image_angle - 70 + random(140);
		}	
	} else {
		if (behaviour_disabled) {
			behaviour_disabled = false;
			audio_play_sound_at(wave_exit, x, y, 0, 1000, 0, 2, 0, 0);
		}
		
	}
	if (y > other.y + other.terminal_horizon) {
		instance_destroy();	
	}
}
