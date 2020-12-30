/// @description Insert description here
// You can write your code in this editor


var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);
audio_listener_position(cx + cw/2, cy + ch/2, 0);
audio_listener_orientation(0,-1,0, 0,0,-1);
if (instance_exists(global.hawk)) {
	audio_listener_velocity(global.hawk.hspeed, global.hawk.vspeed, 0.0);
}

	