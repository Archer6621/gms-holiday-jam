/// @description Insert description here
// You can write your code in this editor

global.max_lights = 8;
global.frames = 0;
global.hawk = noone;
global.dts = 1 / room_speed;

u_light_color = shader_get_uniform(light_shader, "light_color");
u_light_radius = shader_get_uniform(light_shader, "light_radius");
u_light_pos = shader_get_uniform(light_shader, "light_pos");

light_pos[2 * global.max_lights - 1] = 0.0;
light_color[3 * global.max_lights - 1] = 0.0;
light_radius[global.max_lights - 1] = 0.0; 
