/// @description Insert description here
// You can write your code in this editor

event_inherited();

start_light_color = c_black;
end_light_color = c_black;
start_light_radius = 0.0;
start_life_span = 0.0;
start_light_intensity = 0.0;
decay_function = function(amount) {return power(amount, 2)};

function initialize() {
	light_radius = start_light_radius;
	light_color = start_light_color;
	light_intensity = start_light_intensity;
	alarm_set(0, start_life_span * room_speed);
}