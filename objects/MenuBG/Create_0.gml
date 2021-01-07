/// @description Insert description here
// You can write your code in this editor

var w = surface_get_width(application_surface);
var h = surface_get_height(application_surface);
bg_surf = surface_create(w, h);

// uniforms
u_supernova_shockwave_y = shader_get_uniform(screen_shader, "supernova_shockwave_y");
u_supernova_horizon_y = shader_get_uniform(screen_shader, "supernova_horizon_y");
u_frames = shader_get_uniform(screen_shader, "frames");


// Sound
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_listener_position(w/2, h / 2, 0);
audio_listener_orientation(0,-1,0, 0,0,-1);

audio_play_sound_at(shockwave, w / 2, 3 * h, 0, 1000, 0, 2, 1, 0);
audio_play_sound_at(obliteration, w / 2, 4 * h, 0, 1000, 0, 2, 1, 0);



