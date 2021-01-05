/// @description System Failure
// You can write your code in this editor
global.alert_manager.announce(snd_voice_system_failure);
death_malfunction_sound = audio_play_sound(malfunction, 0, true);
if (audio_exists(critical_integrity_sound)) {
	audio_stop_sound(critical_integrity_sound);	
}
audio_play_sound(power_loss, 0, false);