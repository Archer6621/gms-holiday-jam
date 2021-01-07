/// @description Insert description here
// You can write your code in this editor

if (not instance_exists(base_a) or not instance_exists(base_b)) {
	instance_destroy();	
}



if (instance_exists(base_a) and not base_a.behaviour_disabled) {
	if (instance_exists(base_b) and not base_b.behaviour_disabled) {
		orientation = point_direction(base_b.x, base_b.y, base_a.x, base_a.y);
		x = (base_a.x + base_b.x) / 2;
		y = (base_a.y + base_b.y) / 2;

		base_a.image_angle = orientation + 180;
		base_b.image_angle = orientation;
		
		
		var inst = noone;
		inst = collision_line(
		base_a.x - lengthdir_x(0.6 * base_a.sprite_width, orientation), 
		base_a.y - lengthdir_y(0.6 * base_a.sprite_width, orientation), 
		base_b.x - lengthdir_x(0.6 * base_b.sprite_width, 180 + orientation), 
		base_b.y - lengthdir_y(0.6 * base_b.sprite_width, 180 + orientation), 
		Rigidbody,
		true,
		true)
		if (not instance_exists(inst)) {
			inst = collision_line(
			base_a.x - lengthdir_x(0.6 * base_a.sprite_width, orientation) + lengthdir_x(beam_width, orientation + 90), 
			base_a.y - lengthdir_y(0.6 * base_a.sprite_width, orientation) + lengthdir_y(beam_width, orientation + 90), 
			base_b.x - lengthdir_x(0.6 * base_b.sprite_width, 180 + orientation) + lengthdir_x(beam_width, orientation + 90), 
			base_b.y - lengthdir_y(0.6 * base_b.sprite_width, 180 + orientation) + lengthdir_y(beam_width, orientation + 90), 
			Rigidbody,
			true,
			true)
		}
		if (not instance_exists(inst)) {
			inst = collision_line(
			base_a.x - lengthdir_x(0.6 * base_a.sprite_width, orientation) + lengthdir_x(beam_width, orientation - 90), 
			base_a.y - lengthdir_y(0.6 * base_a.sprite_width, orientation) + lengthdir_y(beam_width, orientation - 90), 
			base_b.x - lengthdir_x(0.6 * base_b.sprite_width, 180 + orientation) + lengthdir_x(beam_width, orientation - 90), 
			base_b.y - lengthdir_y(0.6 * base_b.sprite_width, 180 + orientation) + lengthdir_y(beam_width, orientation - 90), 
			Rigidbody,
			true,
			true)
		}
		if (instance_exists(inst)) {
			if (alarm_ready(0)) {
				audio_play_sound_at(snd_hover, other.x, other.y, 0, 1000, 0, 2, 0, -1);
				alarm_set(0, 5);
			}
			
			with (inst) {
				var dir = point_direction(x, y, other.x, other.y)
				var ang_diff = angle_difference(other.orientation, dir);
				
				if (ang_diff > 0) {
					motion_add_m(other.orientation + 90, other.force);
				}
				if (ang_diff < 0) {
					motion_add_m(other.orientation - 90, other.force);	
				}
				
			}
		}
	}
}