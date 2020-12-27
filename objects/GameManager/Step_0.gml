/// @description Insert description here
// You can write your code in this editor

global.frames += 1;
global.hawk = instance_find(Hawk, 0);
global.dts = 1 / room_speed;


// Handle lighting


with Light {
	if (index < global.max_lights) {
		// position
		other.light_pos[2 * index    ] = self.x;
		other.light_pos[2 * index + 1] = self.y;
	
		// color
		other.light_color[3 * index    ] = color_get_red(self.light_color) / 255;
		other.light_color[3 * index + 1] = color_get_green(self.light_color) / 255;
		other.light_color[3 * index + 2] = color_get_blue(self.light_color) / 255;
	
		// radius
		other.light_radius[index] = self.light_radius;
	}
}

shader_set(light_shader)
shader_set_uniform_f_array(u_light_color, light_color);
shader_set_uniform_f_array(u_light_pos, light_pos);
shader_set_uniform_f_array(u_light_radius, light_radius);
shader_reset();