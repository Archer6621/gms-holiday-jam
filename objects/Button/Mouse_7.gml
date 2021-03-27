/// @description Insert description here
// You can write your code in this editor
if (clickable() and not global.ui_lock) {
	if (position_meeting(mouse_x, mouse_y, id)) {
		audio_play_sound(snd_disp_4, 0, 0)
		event_user(0);
	}
}