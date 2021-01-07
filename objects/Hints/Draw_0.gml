/// @description Insert description here
// You can write your code in this editor
draw_set_font(font_small);
draw_self();
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_ext(x + margin, y + margin, text, string_height(text) + 5, sprite_width - 2* margin)