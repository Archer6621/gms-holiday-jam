/// @description Insert description here
// You can write your code in this editor

if (not is_on_screen(max(sprite_width, sprite_height))) {
	exit;	
}

shader_set(light_shader);
texture_set_stage(sample, normal_texture); 
draw_self();
shader_reset();
