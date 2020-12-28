/// @description Insert description here
// You can write your code in this editor

create_projectile(x + hole_x, y + hole_y, Beam);
create_decaying_light(x + hole_x, y + hole_y, c_yellow, c_red, 200.0, 0.20, 0.8);
alarm_set(1, interval * room_speed);
motion_add(image_angle + 180, 1);