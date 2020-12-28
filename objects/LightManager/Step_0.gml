/// @description Insert description here
// You can write your code in this editor

// Handle lighting
with Light {
	if (index < global.max_lights) {
		other.set_light(index, self.x, self.y, self.light_color, self.light_radius, self.light_intensity);
	}
}

shader_set(light_shader)
shader_set_uniform_f_array(u_light_color, light_color);
shader_set_uniform_f_array(u_light_pos, light_pos);
shader_set_uniform_f_array(u_light_radius, light_radius);
shader_set_uniform_f_array(u_light_intensity, light_intensity);
shader_reset();