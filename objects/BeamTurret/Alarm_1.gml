/// @description Insert description here
// You can write your code in this editor


create_projectile(x + hole_x, y + hole_y, Beam);
create_decaying_light(x + hole_x, y + hole_y, c_yellow, c_red, 200.0, 0.20, 0.8);
audio_play_sound_at(beam_shot, x, y, 0, 1000, 0, 2, 0, 0);
motion_add(image_angle + 180, 1);
alarm_set(0, interval * room_speed);

