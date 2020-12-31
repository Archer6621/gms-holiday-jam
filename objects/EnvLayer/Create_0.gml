/// @description Insert description here
// You can write your code in this editor

overlap = 0.4;
sw = 1024;
sh = 1024;
surfaces = [noone, noone, noone];
redraw = [true, true, true];
rot = 0;


// Initializations
proximity = 0;
par = 1;
sprites = [];
density = 0;
scale_min = 0;
scale_max = 0;
scale_desync = 0;
rotation_amount = 0;
tile_rotation_amount = 0;
tile_rotation_dynamic = 0;
grid = []
rot_grid = []
depth_color = c_white;
depth_blend = 0;
opacity_min = 0;
grid_size = 4 * array_length(surfaces);


