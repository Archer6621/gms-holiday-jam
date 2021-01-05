/// @description Insert description here
// You can write your code in this editor
var cursor = 0.25 * display_get_gui_width();
var x_loc = 0;
var abilities = global.upgrade_manager.abilities
for (var i = 0; i < array_length(abilities); i += 1) {
	cursor = draw_icon(abilities[i], cursor);
}

draw_rectangle(0, 100, 0, 100, false);