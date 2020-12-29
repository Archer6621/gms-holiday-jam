/// @description Insert description here
// You can write your code in this editor
if !surface_exists(surf)
{
	surf = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
	view_surface_id[0] = surf;
} 