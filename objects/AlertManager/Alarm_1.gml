/// @description Insert description here
// You can write your code in this editor

if (voice_clip != undefined) {
	if (audio_is_playing(voice_clip_audio)) {
		audio_stop_sound(voice_clip_audio);
	}
	voice_clip_audio = audio_play_sound(voice_clip, 0, 0);
}