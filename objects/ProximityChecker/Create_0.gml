/// @description Insert description here
// You can write your code in this editor
object = noone;
follow = noone;
proximity_dist = 0;
dist = 0;
prev_dist = dist;
y_dist = 0;
prev_y_dist = y_dist;

function p_enter() {
	return dist < proximity_dist and prev_dist >= proximity_dist;
}

function p_exit() {
	return dist > proximity_dist and prev_dist <= proximity_dist;
}

function p_enter_y() {
	
	return y_dist < proximity_dist and prev_y_dist >= proximity_dist;
}

function p_exit_y() {
	return y_dist > proximity_dist and prev_y_dist <= proximity_dist;
}