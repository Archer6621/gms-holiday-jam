/// @description Insert description here
// You can write your code in this editor
if surface_exists(surf)
{
	draw_clear(c_black);
	shader_set(screen_shader);
	with (SuperNova) {
		var shockwave_pos = (y - camera_get_view_y(view_camera[0])) / camera_get_view_height(view_camera[0]);
		var horizon_pos = (y + terminal_horizon - camera_get_view_y(view_camera[0])) / camera_get_view_height(view_camera[0]);
		shader_set_uniform_f(other.u_supernova_shockwave_y, shockwave_pos);
		shader_set_uniform_f(other.u_supernova_horizon_y, horizon_pos);
	}
	shader_set_uniform_f(u_frames, global.frames);
	draw_surface_stretched(surf, 0, 0, display_get_gui_width(), display_get_gui_height());
	shader_reset();
	
	with (SuperNova) {
		var margin = 40;
		var ch = display_get_gui_height();
		var cw = display_get_gui_width();
		var pa = draw_get_alpha();
		var pc = draw_get_color();
		var ui_height = ch - 2 * margin;
		

		var loc1 = min(ui_height * y / room_height, ui_height);
		var loc2 = min(ui_height * (y + terminal_horizon) / room_height, ui_height);
		draw_set_alpha(0.4);
		draw_set_color(c_grey);
		draw_rectangle(cw - 2 * margin, margin, cw - margin, ch - margin, false);
		draw_set_color(c_yellow);
		draw_rectangle(cw - 2 * margin, margin + loc1, cw - margin, margin + loc2, false );
		draw_set_color(c_red);
		draw_set_alpha((0.75 + 0.25 * sin(0.05 * global.frames)));
		draw_rectangle(cw - 2 * margin, margin + loc2, cw - margin, margin + ui_height, false );
		
		var warp_zone = instance_find(WarpZone,0);
		if (instance_exists(warp_zone)) {
			draw_set_color(c_aqua);
			var warp_loc = min(ui_height * warp_zone.y / room_height, ui_height)
			draw_line(cw - 2 * margin, margin + warp_loc, cw - margin, margin + warp_loc); 
		}
		
		if (instance_exists(global.hawk)) {
			other.hawk_loc = ui_height * global.hawk.y / room_height;
			draw_set_color(c_lime);
		} else {
			draw_set_color(c_red);	
		}
		
		draw_arrow(cw - 2.5 * margin, margin + other.hawk_loc, cw - 2.1 * margin, margin + other.hawk_loc, 50);
		draw_set_alpha(1.0);
		draw_line(cw - 2 * margin, margin + other.hawk_loc, cw - margin, margin + other.hawk_loc); 
		

		
		draw_set_color(pc);
		draw_set_alpha(pa);
	}
	
} 