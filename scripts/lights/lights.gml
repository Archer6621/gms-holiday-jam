// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_decaying_light(xx, yy, start_color, end_color, radius, life_span, start_intensity){
	var light = instance_create(DecayingLight);
	light.x = xx;
	light.y = yy;
	light.start_light_color = start_color;
	light.end_light_color = end_color;
	light.start_light_radius = radius;
	light.start_life_span = life_span;
	light.start_light_intensity = start_intensity;
	light.initialize();
	return light;
}

function create_basic_light(xx, yy, color, radius, intensity) {
	var light = instance_create(BasicLight);
	light.x = xx;
	light.y = yy;
	light.light_color = color;
	light.light_radius = radius;
	light.light_intensity = intensity;
	return light;
}

function create_following_light(instance, color, radius, intensity, offset_x, offset_y) {
	var light = instance_create(FollowingLight);
	if (offset_x != undefined) {
		light.offset_x = offset_x;	
	}
	if (offset_y != undefined) {
		light.offset_x = offset_y;	
	}
	light.following = instance;
	light.light_color = color;
	light.light_radius = radius;
	light.light_intensity = intensity;
	return light;
}