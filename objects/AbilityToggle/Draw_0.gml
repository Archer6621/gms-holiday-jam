/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (not is_undefined(ability)) {
	var xscale = 0.8 * sprite_width / sprite_get_width(ability.icon);
	var yscale = 0.8 * sprite_height / sprite_get_height(ability.icon);
	draw_sprite_ext(ability.icon,0,x + 0.2 * sprite_width/2 ,y + 0.2 * sprite_height/2,xscale, yscale, 0, c_white, 0.5);
}