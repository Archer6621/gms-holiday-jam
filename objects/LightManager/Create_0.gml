/// @description Insert description here
// You can write your code in this editor

global.max_lights = 8;
global.light_manager = self.id;
u_light_color = shader_get_uniform(light_shader, "light_color");
u_light_radius = shader_get_uniform(light_shader, "light_radius");
u_light_pos = shader_get_uniform(light_shader, "light_pos");

light_pos[2 * global.max_lights - 1] = 0.0;
light_color[3 * global.max_lights - 1] = 0.0;
light_radius[global.max_lights - 1] = 0.0; 

light_queue = ds_queue_create();


for (var i = 0; i < global.max_lights; i += 1) {
	ds_queue_enqueue(light_queue, i);
}

function register_light() {
		return ds_queue_dequeue(light_queue);
}

function free_light(index) {
	set_light(index, 0, 0, c_black, 0);
	ds_queue_enqueue(light_queue, index);
}

function set_light(index, xx, yy, color, radius) {
	// position
	light_pos[2 * index    ] = xx;
	light_pos[2 * index + 1] = yy;
	
	// color
	light_color[3 * index    ] = color_get_red(color) / 255;;
	light_color[3 * index + 1] = color_get_green(color) / 255;
	light_color[3 * index + 2] = color_get_blue(color) / 255;
	
	// radius
	light_radius[index] = radius;
}