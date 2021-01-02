// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_bar(instance, accessor, min_value, max_value, xx, yy, width, height, b_color, follow, reverse) {
	var bar = instance_create_depth(xx, yy, -10, Bar);
	bar.instance = instance;
	bar.accessor = accessor;

	bar.min_value = min_value;
	bar.max_value = max_value;
	bar.b_width = width;
	bar.b_height = height;
	if (follow) {
		bar.offset_x = xx - 0.5 * width;
		bar.offset_y = yy - 0.5 * height;
	}
	bar.b_color = b_color;
	bar.follow = follow;
	bar.reverse = reverse;
	return bar;
}