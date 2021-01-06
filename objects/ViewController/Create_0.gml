/// @description Insert description here
// You can write your code in this editor
surf = noone;

u_supernova_shockwave_y = shader_get_uniform(screen_shader, "supernova_shockwave_y");
u_supernova_horizon_y = shader_get_uniform(screen_shader, "supernova_horizon_y");
u_frames = shader_get_uniform(screen_shader, "frames");


// UI inits
margin = 40;
ui_height = display_get_gui_height() - 2 * margin;