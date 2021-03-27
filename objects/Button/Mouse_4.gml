/// @description Insert description here
// You can write your code in this editor

if (clickable() and not global.ui_lock) {
	if (position_meeting(mouse_x, mouse_y, id)) {
		audio_play_sound(snd_disp_1, 0, 0)
		image_blend = c_dkgray;	
	}
} else {
	audio_play_sound(alert_2, 0, 0);			
}