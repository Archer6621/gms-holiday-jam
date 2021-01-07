/// @description Insert description here
// You can write your code in this editor
if (instance_exists(base_a) and not base_a.behaviour_disabled) {
	if (instance_exists(base_b) and not base_b.behaviour_disabled) {
		
			//var xa = base_a.x - lengthdir_x(0.6 * base_a.sprite_width, orientation)
			//var ya = base_a.y - lengthdir_y(0.6 * base_a.sprite_width, orientation)
			//var xb = base_b.x - lengthdir_x(0.6 *  base_b.sprite_width, 180 + orientation)
			//var yb = base_b.y - lengthdir_y(0.6 * base_b.sprite_width, 180 + orientation)
			
			//draw_line_width_color(xa, ya, xb, yb, 8, c_white, c_white);
		
			draw_line_color(base_a.x, base_a.y, base_b.x, base_b.y, c_aqua, c_blue );
			var pa = draw_get_alpha();
			gpu_set_blendmode(bm_add);
			draw_set_alpha(0.55);
			draw_line_width_color(base_a.x, base_a.y, base_b.x, base_b.y, 3, c_blue, c_aqua);
			draw_line_width_color(base_a.x, base_a.y, base_b.x, base_b.y, 5, c_aqua, c_blue);
			gpu_set_blendmode(bm_normal);
			draw_set_alpha(pa);

	}
}