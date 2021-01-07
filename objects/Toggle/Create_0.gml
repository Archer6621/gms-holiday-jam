/// @description Insert description here
// You can write your code in this editor
event_inherited();
image_blend = merge_colour(c_dkgray, c_black, 0.25);
enabled = false;
prev_enabled = enabled;
text = "";
text_scale = 1;


active = function() {
	return true;	
}

clickable = function() {
	return true;	
}

state = function() {
	return false;	
}

func = function() {
	return false;
}