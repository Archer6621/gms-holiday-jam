/// @description Insert description here
// You can write your code in this editor
prev_hawk_dist = hawk_dist;
if (instance_exists(global.hawk)) {
	hawk_dist = abs(global.hawk.y - y);
	if (prev_hawk_dist > notify_dist and hawk_dist <= notify_dist) {
		global.alert_manager.queue_notification("APPROACHING DATA EXTRACTION POINT", alert_1, snd_voice_data_extraction);
	}
	
	if (hawk_dist < extraction_radius) {
		data_extracted += 1 / room_speed;	
	}
	
	if (data_extracted >= data) {
		// Destroy all points
		with (DataExtractionPoint) {
			instance_destroy();
		}
		global.alert_manager.queue_notification("DATA RECEIVED", alert_1, snd_voice_data_received);
	}
}