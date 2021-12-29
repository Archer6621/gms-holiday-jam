/// @description Insert description here
// You can write your code in this editor
if !surface_exists(surf)
{
	surf = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
	view_surface_id[0] = surf;
} 

if !surface_exists(bloom_surf)
{
	bloom_surf = surface_create(camera_get_view_width(view_camera[0])/2, camera_get_view_height(view_camera[0])/2);
} 

if !surface_exists(intermediate)
{
	intermediate = surface_create(camera_get_view_width(view_camera[0])/2, camera_get_view_height(view_camera[0])/2);
} 

if !surface_exists(intermediate2)
{
	intermediate2 = surface_create(camera_get_view_width(view_camera[0])/2, camera_get_view_height(view_camera[0])/2);
} 
