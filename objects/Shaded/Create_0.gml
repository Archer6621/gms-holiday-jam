/// @description Insert description here
// You can write your code in this editor


var normal_name = sprite_get_name(sprite_index)+"_n";
var normal_index = asset_get_index(normal_name);
if (normal_index == -1) {
	normal_index = sprite_index;	
}
sample = shader_get_sampler_index(light_shader, "normal");
normal_texture = sprite_get_texture(normal_index, 0);