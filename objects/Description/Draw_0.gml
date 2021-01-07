/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(font_small);
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_ext(x + sprite_width/2, y + sprite_height/2, text, string_height(text) + 5, sprite_width)
draw_set_halign(fa_left)
draw_set_valign(fa_top)