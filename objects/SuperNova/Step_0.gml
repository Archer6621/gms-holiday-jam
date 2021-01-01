/// @description Insert description here
// You can write your code in this editor

y -= supernova_speed / room_speed;
var cx = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
audio_emitter_position(shockwave_emitter, cx, y, 0.0);
audio_emitter_position(terminal_horizon_emitter, cx, y + terminal_horizon, 0.0);

supernova_light.x = cx;
supernova_light.y = y + terminal_horizon;

with (Rigidbody) {
	if (y > other.y) {
		if (not in_shockwave)
		{
			event_user(2);
			in_shockwave = true;
		}	
	} else {
		if (in_shockwave) {
			in_shockwave = false;
			event_user(3);
		}
		
	}
	if (y > other.y + other.terminal_horizon) {
		instance_destroy();	
	}
}
