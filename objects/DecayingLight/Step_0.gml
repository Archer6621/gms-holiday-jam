/// @description Insert description here
// You can write your code in this editor

var life = d_alarm_get(0) / (game_get_speed(gamespeed_fps) * start_life_span);
if (decay_function == noone) {
	//light_radius = life * start_light_radius;
	light_intensity = life;
	light_color = merge_color(end_light_color, start_light_color, life);
} else {
	var amount = decay_function(life);
	//light_radius = amount * start_light_radius;
	light_intensity = amount;
	light_color = merge_color(end_light_color, start_light_color, amount);
}