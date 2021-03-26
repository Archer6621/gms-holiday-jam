/// @description Insert description here
// You can write your code in this editor
event_inherited();

global.alert_manager = id;
display_rate = 0.05 * game_get_speed(gamespeed_fps);
display_rate_variation = 0.05 * game_get_speed(gamespeed_fps);
fade_after = 1; // seconds;
fade = false;
voice_clip = undefined;
voice_clip_audio = noone;
current_message = "";
display_message = "";
notification_queue = ds_queue_create();
ready = true;

function show_notification(message_string,  alert_sound, voice_clip) {
	alarm_stop(2);
	alarm_stop(1);
	alarm_stop(0);
	d_alarm_set(1, 0.5 * game_get_speed(gamespeed_fps) * audio_sound_length(alert_sound));
	self.voice_clip = voice_clip;
	fade = false;
	image_alpha = 1;
	audio_play_sound(alert_sound, 0, 0);
	
	display_message = message_string;
	current_message = "";
}

function queue_notification(message_string, alert_sound, voice_clip, priority) {
	ds_queue_enqueue(notification_queue, [message_string, alert_sound, voice_clip]);
	if (priority != undefined and priority) {
		repeat(ds_queue_size(notification_queue) - 1) {
			var temp = ds_queue_dequeue(notification_queue);
			ds_queue_enqueue(temp);
		}
	}
}

function announce(voice_clip) {
	self.voice_clip = undefined;
	if (audio_is_playing(voice_clip_audio)) {
		audio_stop_sound(voice_clip_audio);
	}
	voice_clip_audio = audio_play_sound(voice_clip, 0, 0);
}