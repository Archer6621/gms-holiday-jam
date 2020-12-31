/// @description Insert description here
// You can write your code in this editor


var ch = camera_get_view_height(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (instance_exists(global.hawk)) {
	audio_listener_velocity(global.hawk.hspeed, global.hawk.vspeed, 0.0);
	cx = clamp(global.hawk.x - cw/2, 0, room_width - cw);
	cy = clamp(global.hawk.y - 0.7 * ch, 0, room_height - ch);
	camera_set_view_pos(view_camera[0], cx, cy);
}

audio_listener_position(cx + cw/2, cy + ch/2, 0);
audio_listener_orientation(0,-1,0, 0,0,-1);