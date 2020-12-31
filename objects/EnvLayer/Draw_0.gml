/// @description Insert description here
// You can write your code in this editor
if (proximity > 0.01) {
	var cam = view_camera[0];
	var cw = camera_get_view_width(cam);
	var ch = camera_get_view_height(cam);
	var cx = camera_get_view_x(cam);
	var cy = camera_get_view_y(cam);
	var pcx = par * cx;
	var pcy = par * cy;
	var dts = 1 / room_speed;

	rot += dts * tile_rotation_dynamic;
	col = merge_colour(c_white, depth_color, depth_blend);
	random_set_seed(instance_count);
	for (var s = 0; s < array_length(surfaces); s+=1) {
		var surf = surfaces[s];
		if (surface_exists(surf)) {
			if (redraw[s]) {
				surface_set_target(surf);
				var amount = density * sw * sh;
				for (var i = 0 ; i < amount ; i++) {
					var sprite = array_choose(sprites);
					var eq = scale_min + random(scale_max - scale_min);
					var xs = eq + random(scale_desync);
					var ys = eq + random(scale_desync);
				
			
					var clearance = 0.5 * point_distance(0, 0, xs * sprite_get_width(sprite), ys * sprite_get_height(sprite));
					var xp = clearance + random(sw - 2 * clearance);
					var yp = clearance + random(sh - 2 * clearance);
				
					if (sw - 2 * clearance < 0 or sh - 2 * clearance < 0) {
						continue;
					}
			
					draw_sprite_ext(
						sprite, 
						0, 
						xp, 
						yp, 
						xs, 
						ys,
						random(rotation_amount),
						c_white, 
						opacity_min + random(1 - opacity_min)
					);
				}
				surface_reset_target();
				redraw[s] = false;
			}
		} else {
			surf = surface_create(sw, sh);
			redraw[s] = true;
		}
		surfaces[s] = surf;
	}
	
	// Drawing is done in one pass per variant
	// This can be made even more efficient if we store the x/y indices per variant
	// since then we only have to do a single pass through the grid
	// but usually the on-screen grid is insignificantly small
	for (var i = 0; i < array_length(surfaces); i += 1) {
		var asw = sw * (1 - overlap);
		var ash = sh * (1 - overlap);
		var i_w = ceil(pcx / asw)
		var i_h = ceil(pcy / ash)
		var x_count = ceil((cw + 2 * sw) / asw);
		var y_count = ceil((ch + 2 * sh) / ash);
		for (var i_x = 0; i_x < x_count + 2; i_x += 1) {
			for (var i_y = 0; i_y < y_count + 2; i_y += 1) {
				var safety = 10; // So it doesn't go below zero, gamemaker's mod can't deal with it and custom function is very slow
				var g_x = (i_h + i_y + safety) % grid_size;
				var g_y = (i_w + i_x + safety) % grid_size;
				if (grid[g_x, g_y] == i) {
					var surf = surfaces[grid[g_x, g_y]];
					if (surface_exists(surf)) {
						var surface_x = (i_w + i_x - 1) * asw - (sw - asw) + (1 - par) * cx;
						var surface_y = (i_h + i_y - 1) * ash - (sh - ash) + (1 - par) * cy;
						draw_surface_ext(surf, surface_x, surface_y, 1,  1, rot + rot_grid[g_x, g_y], col, proximity);	
					}
				}
			}
		}
	}
} else {
	for (var s = 0; s < array_length(surfaces); s+=1) {
		var surf = surfaces[s];
		if (surface_exists(surf)) {
			surface_free(surf);
		}
		surfaces[s] = surf;
	}
}