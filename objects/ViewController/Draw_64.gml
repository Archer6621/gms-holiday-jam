/// @description Insert description here
// You can write your code in this editor
if surface_exists(surf)
{
	draw_clear(c_black);
	shader_set(threshold_shader);
	surface_set_target(intermediate);
	draw_clear(c_black);
	//draw_surface_ext(surf, 0, 0);
	draw_surface_ext(surf, 0, 0, 0.5, 0.5, 0, c_white, 1.0);
	//surface_reset_target();
	surface_reset_target();
	shader_reset();
	

	//draw_surface_stretched(bloom_surf, 0, 0, display_get_gui_width(), display_get_gui_height());
	
	shader_set(bloom_shader);
	surface_set_target(intermediate2);
	//draw_clear(c_black);
	texture_set_stage(bloom_sampler, surface_get_texture(intermediate));
	//texture_set_stage(b_i_sampler, surface_get_texture(bloom_surf));
	shader_set_uniform_i(u_bloom_h, 1);
	//(c_black);
	draw_surface(intermediate, 0, 0);
	//draw_surface(bloom_surf, 0, 0);
	surface_reset_target();
	surface_set_target(bloom_surf);
	texture_set_stage(bloom_sampler, surface_get_texture(intermediate2));
	shader_set_uniform_i(u_bloom_h, 0);
	draw_surface(intermediate2, 0, 0);
	shader_reset();
	//draw_surface_stretched(bloom_surf, 0, 0, display_get_gui_width(), display_get_gui_height());

	//texture_set_stage(bloom_sampler, surface_get_texture(bloom_surf));
	//texture_set_stage(b_i_sampler, surface_get_texture(bloom_surf));
	//shader_set_uniform_i(u_bloom_h, 0);
	//draw_surface(intermediate, 0, 0);
	//draw_surface_stretched(bloom_surf, 0, 0, display_get_gui_width(), display_get_gui_height());
	
	
	
	surface_reset_target();
	//draw_surface_stretched(surf, 0, 0, display_get_gui_width(), display_get_gui_height());

	
	shader_set(screen_shader);
	with (SuperNova) {
		var shockwave_pos = (y - camera_get_view_y(view_camera[0])) / camera_get_view_height(view_camera[0]);
		var horizon_pos = (y + terminal_horizon - camera_get_view_y(view_camera[0])) / camera_get_view_height(view_camera[0]);
		shader_set_uniform_f(other.u_supernova_shockwave_y, shockwave_pos);
		shader_set_uniform_f(other.u_supernova_horizon_y, horizon_pos);
	}
	shader_set_uniform_f(u_frames, global.frames);
	draw_surface_stretched(surf, 0, 0, display_get_gui_width(), display_get_gui_height());
	gpu_set_blendmode(bm_add);
	draw_surface_stretched(bloom_surf, 0, 0, display_get_gui_width(), display_get_gui_height());
	gpu_set_blendmode(bm_normal);
	
	shader_reset();
	
	if (not global.endless) {
		// UI
		var pa = draw_get_alpha();
		var pc = draw_get_color();
		self.ch = display_get_gui_height();
		self.cw = display_get_gui_width();
		self.ui_height = display_get_gui_height() - 2 * self.margin;
	
		with (SuperNova) {
			var ch = other.ch;
			var cw = other.cw;
			var ui_height = other.ui_height;
			var margin = other.margin;

			var loc1 = min(ui_height * y / room_height, ui_height);
			var loc2 = min(ui_height * (y + terminal_horizon) / room_height, ui_height);
			draw_set_alpha(global.ui_alpha * 0.4);
			draw_set_color(c_grey);
			draw_rectangle(cw - 2 * margin, margin, cw - margin, ch - margin, false);
			draw_set_color(c_yellow);
			draw_rectangle(cw - 2 * margin, margin + loc1, cw - margin, margin + loc2, false );
			draw_set_color(c_red);
			draw_set_alpha(global.ui_alpha * (0.75 + 0.25 * sin(0.05 * global.frames)));
			draw_rectangle(cw - 2 * margin, margin + loc2, cw - margin, margin + ui_height, false );
		}
	
		draw_set_color(c_aqua);
		with (WarpZone) {
			var ch = other.ch;
			var cw = other.cw;
			var ui_height = other.ui_height;
			var margin = other.margin;
		
			var warp_loc = min(ui_height * y / room_height, ui_height)
			draw_rectangle(cw - 2 * margin, margin, cw - margin, margin + warp_loc, false); 
		}
	
		with (Hawk) {
			var ch = other.ch;
			var cw = other.cw;
			var ui_height = other.ui_height;
			var margin = other.margin;
			var hawk_loc = ui_height * global.hawk.y / room_height;
			var hawk_x = margin * x / room_width;
		
			draw_set_color(c_lime);
			draw_line(cw - 2 * margin, margin + hawk_loc, cw - margin, margin + hawk_loc); 
			draw_arrow(cw - 2.5 * margin, margin + hawk_loc, cw - 2.1 * margin, margin + hawk_loc, 50);
			draw_circle(cw - 2 * margin + hawk_x, margin + hawk_loc, 2, false);
		}
	
		with (DataExtractionPoint) {
			var xx = other.margin * x / room_width;
			var yy = other.ui_height * y / room_height;
			draw_set_color(c_aqua);
			draw_circle(cw - 2 * margin + xx, margin + yy, 2, false);
		}
		

		draw_set_color(pc);
		draw_set_alpha(pa);
	}
} 