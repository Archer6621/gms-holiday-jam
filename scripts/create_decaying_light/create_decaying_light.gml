// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_decaying_light(xx, yy, start_color, end_color, radius, life_span){
	var light = instance_create(DecayingLight);
	light.x = xx;
	light.y = yy;
	light.start_light_color = start_color;
	light.end_light_color = end_color;
	light.start_light_radius = radius;
	light.start_life_span = life_span;
	light.initialize();
}