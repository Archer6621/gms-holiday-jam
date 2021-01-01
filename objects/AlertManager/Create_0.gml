/// @description Insert description here
// You can write your code in this editor

global.alert_manager = id;
display_rate = 0.05 * room_speed;
display_rate_variation = 0.05 * room_speed;
fade_after = 1; // seconds;
fade = false;
voice_clip = undefined;
current_message = "";
display_message = "";
notification_queue = ds_queue_create();
ready = true;

function show_notification(message_string,  alert_sound, voice_clip) {
	alarm_stop(2);
	alarm_stop(1);
	alarm_stop(0);
	alarm_set(1, room_speed * audio_sound_length(alert_sound));
	self.voice_clip = voice_clip;
	fade = false;
	image_alpha = 1;
	audio_play_sound(alert_sound, 0, 0);
	
	display_message = message_string;
	current_message = "";
}

function queue_notification(message_string, alert_sound, voice_clip) {
	ds_queue_enqueue(notification_queue, [message_string, alert_sound, voice_clip]);	
}