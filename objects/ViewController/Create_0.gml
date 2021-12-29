/// @description Insert description here
// You can write your code in this editor
surf = noone;
bloom_surf = noone;
intermediate = noone;
intermediate2 = noone;
bloom_sampler = shader_get_sampler_index(bloom_shader, "thresholded");
//b_i_sampler = shader_get_sampler_index(bloom_shader, "intermediate");
u_bloom_h = shader_get_uniform(bloom_shader, "h");

u_supernova_shockwave_y = shader_get_uniform(screen_shader, "supernova_shockwave_y");
u_supernova_horizon_y = shader_get_uniform(screen_shader, "supernova_horizon_y");
u_frames = shader_get_uniform(screen_shader, "frames");
endless = false;

// UI inits
margin = 40;
ui_height = display_get_gui_height() - 2 * margin;

// View speed
cvx = 0;
cvy = 0;
prev_cx = 0;
prev_cy = 0;