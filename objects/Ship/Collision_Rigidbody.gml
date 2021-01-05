/// @description Insert description here
// You can write your code in this editor
event_inherited();
audio_play_sound_at(metal_col_1, x, y, 0, 1000, 0, 2, 0, 0);
var rel_speed_dir = point_direction(0, 0, rel_hspeed, rel_vspeed);
if (abs(angle_difference(rel_speed_dir, bounce_dir)) < 60) {
	knock_out((ceil(0.2 * rel_speed) / knockout_speed));
}
