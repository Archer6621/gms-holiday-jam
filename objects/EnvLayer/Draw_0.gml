/// @description Insert description here
// You can write your code in this editor
if (proximity > 0.001) {
	var cam = view_camera[0];
	var cw = camera_get_view_width(cam) 
	var ch = camera_get_view_height(cam)
	var cx = par * camera_get_view_x(cam);
	var cy = par * camera_get_view_y(cam);
	var dts = 1 / room_speed;

	rot += dts * tile_rotation_dynamic;
	col = merge_colour(c_white, depth_color, depth_blend);

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
						random(1)
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
		var i_w = ceil(cx / asw)
		var i_h = ceil(cy / ash)
		var x_count = ceil((cw + 2 * sw) / asw);
		var y_count = ceil((ch + 2 * sh) / ash);
		random_set_seed(instance_count);
		for (var i_x = -1; i_x < x_count + 1; i_x += 1) {
			for (var i_y = -1; i_y < y_count + 1; i_y += 1) {
				var g_x = modulo(i_h + i_y, 4 * array_length(surfaces));
				var g_y = modulo(i_w + i_x, 4 * array_length(surfaces));
				if (grid[g_x, g_y] == i) {
					var surf = surfaces[grid[g_x, g_y]];
					if (surface_exists(surf)) {
						var surface_x = (i_w + i_x) * asw - (sw - asw) + (1 - par) * camera_get_view_x(cam);
						var surface_y = (i_h + i_y) * ash - (sh - ash) + (1 - par) * camera_get_view_y(cam);
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