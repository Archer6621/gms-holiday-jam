// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_bar(instance, accessor, state_accessor, min_value, max_value, xx, yy, width, height, b_colors, follow, reverse, label) {
	var bar = instance_create_depth(xx, yy, -10, Bar);
	bar.instance = instance;
	bar.accessor = accessor;
	bar.state_accessor = state_accessor;
	if (not is_undefined(label)) {bar.label = label};
	bar.min_value = min_value;
	bar.max_value = max_value;
	bar.b_width = width;
	bar.b_height = height;
	if (follow) {
		bar.offset_x = xx - 0.5 * width;
		bar.offset_y = yy - 0.5 * height;
	}
	bar.b_colors = b_colors;
	bar.follow = follow;
	bar.reverse = reverse;
	return bar;
}

function create_count(instance, accessor, state_accessor, xx, yy, follow, label) {
	var count = instance_create_depth(xx, yy, -10, Count);
	count.instance = instance;
	count.accessor = accessor;
	count.state_accessor = state_accessor;
	if (not is_undefined(label)) {count.label = label};
	if (follow) {
		count.offset_x = xx;
		count.offset_y = yy;
	}
	count.follow = follow;
	return count;
}

function Label(label_text, place_under) constructor {
	text = label_text;
	under = place_under;
}


