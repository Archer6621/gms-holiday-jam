/// @description Insert description here
// You can write your code in this editor
icon_draw_size = 32;
icon_pixel_size = sprite_get_width(spr_ability_placeholder);
icon_scale = icon_draw_size / icon_pixel_size;
margin = 0.125 * icon_draw_size;

function draw_icon(ability, location) {
	var scale = is_undefined(ability.dependency) ? icon_scale : 0.5 * icon_scale;
	var color = ability.unlocked ? c_white : c_dkgrey;
	draw_sprite_ext(ability.icon, 0, location, display_get_gui_height() - 1 * icon_draw_size - margin, scale, scale, 0, color, global.ui_alpha);
	return location + (scale / icon_scale) * icon_draw_size + margin;
}