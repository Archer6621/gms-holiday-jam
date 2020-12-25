/// @description Insert description here
// You can write your code in this editor

var beam = create_projectile(x + hole_x, y + hole_y, Beam);
show_debug_message("--");
show_debug_message(self.id);
show_debug_message(beam.instigator);
alarm_set(1, interval * room_speed);
motion_add(image_angle + 180, 1);