/// @description Insert description here
// You can write your code in this editor
d_speed = 5;
direction = 90;
with (EnvLayer) {
	set_override(other.d_speed, other.direction, other.bg_surf);	
}

if (
surface_get_width(bg_surf) != surface_get_width(application_surface) or
surface_get_height(bg_surf) != surface_get_height(application_surface)
) {
	surface_free(bg_surf);	
}

randomize()
if (random(1) > 0.95) {
	create_decaying_light(random(window_get_width()), random(window_get_height()), merge_colour(choose(c_fuchsia, c_blue, c_aqua), c_white, 0.25), c_black, 100, 1.0, 10);
}
