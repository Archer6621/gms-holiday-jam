/// @description Insert description here
// You can write your code in this editor
if (not surface_exists(bg_surf)) {
	var w = surface_get_width(application_surface);
	var h = surface_get_height(application_surface);
	bg_surf = surface_create(w, h);
	with (EnvLayer) {
		override_surf = other.bg_surf;	
	}
}