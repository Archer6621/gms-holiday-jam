/// @description Insert description here
// You can write your code in this editor

// Handle lighting
with Light {
	ds_priority_add(other.light_p_queue, id, other.get_priority(id));
}

for (var i = 0; i < global.max_lights; i += 1) {
	if (not ds_priority_empty(light_p_queue)) {
		var light = ds_priority_delete_max(light_p_queue);
		if (instance_exists(light)) {
			set_light(i, light.x, light.y, light.light_color, light.light_radius, light.light_intensity);
		}
	} else {
		reset_light(i);
	}
}
ds_priority_clear(light_p_queue);


shader_set(light_shader)
shader_set_uniform_f_array(u_light_color, light_color);
shader_set_uniform_f_array(u_light_pos, light_pos);
shader_set_uniform_f_array(u_light_radius, light_radius);
shader_set_uniform_f_array(u_light_intensity, light_intensity);
shader_reset();

shader_set(bg_light_shader)
shader_set_uniform_f_array(u_bg_light_color, light_color);
shader_set_uniform_f_array(u_bg_light_pos, light_pos);
shader_set_uniform_f_array(u_bg_light_radius, light_radius);
shader_set_uniform_f_array(u_bg_light_intensity, light_intensity);
shader_reset();