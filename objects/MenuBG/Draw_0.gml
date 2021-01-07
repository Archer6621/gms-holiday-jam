/// @description Insert description here
// You can write your code in this editor
if (surface_exists(bg_surf)) {
	shader_set(screen_shader)
	shader_set_uniform_f(u_supernova_shockwave_y, 1.0);
	shader_set_uniform_f(u_supernova_horizon_y, 1.4);
	shader_set_uniform_f(u_frames, global.frames);
	draw_surface_stretched(bg_surf, 0, 0, window_get_width(), window_get_height());
	shader_reset();
	surface_set_target(bg_surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
}
	