/// @description Insert description here
// You can write your code in this editor

// "Observes" an instance
instance = noone;
accessor = undefined;
state_accessor = undefined;
label = new Label("", false);

min_value = -infinity; 
max_value = infinity;

offset_x = 0;
offset_y = 0;

follow = false;

function get_value() {
	if (instance_exists(instance)) {
		if (not is_undefined(accessor)) {
			return clamp(accessor(instance), min_value, max_value);	
		}
	}
	return 0;
}

function draw() {
	
}

function draw_label(w, h) {
	draw_set_font(font_small);
	if (label.under) {
		draw_set_halign(fa_center);
		draw_text(x + w/2, y  + h + 0.1 * string_height(label.text), label.text);
	} else {
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		draw_text(x - 0.1 * string_height(label.text), y + h/2, label.text);
	}
}