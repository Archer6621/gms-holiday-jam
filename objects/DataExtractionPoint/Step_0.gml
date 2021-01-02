/// @description Insert description here
// You can write your code in this editor
prev_hawk_dist = hawk_dist;
prev_hawk_y_dist = hawk_y_dist;
if (instance_exists(global.hawk)) {
	hawk_dist = point_distance(global.hawk.x, global.hawk.y, x, y);
	hawk_y_dist = abs(global.hawk.y - y);
	if (prev_hawk_y_dist > notify_dist and hawk_y_dist <= notify_dist) {
		global.alert_manager.queue_notification("APPROACHING DATA EXTRACTION POINT", alert_1, snd_voice_data_extraction);
	}
	
	if (hawk_dist < extraction_radius) {
		if (prev_hawk_dist >= extraction_radius) {
			extract_sound = audio_play_sound(snd_disp_1, 0, true);	
			audio_sound_pitch(extract_sound, 0.5);
		}
		data_extracted += 1 / room_speed;	
	}
	
	if (hawk_dist > extraction_radius and prev_hawk_dist <= extraction_radius) {
		if (audio_exists(extract_sound)) {
			audio_stop_sound(extract_sound);	
		}
	}

	
	if (data_extracted >= data) {
		if (audio_exists(extract_sound)) {
			audio_stop_sound(extract_sound);	
		}
		// Destroy all points
		with (DataExtractionPoint) {
			instance_destroy();
		}
		// Skip queue
		global.alert_manager.show_notification("DATA RECEIVED", snd_data_received, snd_voice_data_received);
	}
}