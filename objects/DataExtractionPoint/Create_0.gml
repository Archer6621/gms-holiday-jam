/// @description Insert description here
// You can write your code in this editor
event_inherited();
data = 2;
data_extracted = 0;
extract_sound = noone;
var ds = global.game_manager.difficulty_scaling;
extraction_radius = 325 - 75 * ds;
notify_dist = 3000;
hawk_dist = room_height;
prev_hawk_dist = hawk_dist;
extraction_bar = noone;

hawk_y_dist = 0;
prev_hawk_y_dist = hawk_y_dist;