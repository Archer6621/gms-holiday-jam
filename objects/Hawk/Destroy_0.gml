/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (audio_exists(malfunction_sound)) {
	audio_stop_sound(malfunction_sound);	
}
if (audio_exists(death_malfunction_sound)) {
	audio_stop_sound(death_malfunction_sound);	
}
if (audio_exists(critical_integrity_sound)) {
	audio_stop_sound(critical_integrity_sound);	
}
audio_play_sound_at(death, x, y, 0, 1000, 0, 2, 0, 0);
global.manager.lost = true;
delayed_action(function () {global.game_manager.end_session()}, 4.0);