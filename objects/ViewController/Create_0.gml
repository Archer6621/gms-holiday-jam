/// @description Insert description here
// You can write your code in this editor
global.view_controller = self.id;
hawk_loc = 0;
surf = noone;

u_supernova_shockwave_y = shader_get_uniform(screen_shader, "supernova_shockwave_y");
u_supernova_horizon_y = shader_get_uniform(screen_shader, "supernova_horizon_y");
u_frames = shader_get_uniform(screen_shader, "frames");
