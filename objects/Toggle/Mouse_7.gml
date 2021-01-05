/// @description Insert description here
// You can write your code in this editor

if (clickable()) {
	if (position_meeting(mouse_x, mouse_y, id)) {
		image_blend = c_white;
		if (active()) {
			func();
		}
	}
}