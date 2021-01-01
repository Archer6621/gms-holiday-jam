/// @description Shockwave enter
// You can write your code in this editor
create_spark(c_white, x, y, 0.5 * image_xscale, true);
audio_play_sound_at(choose(wave_hit, wave_hit_2), x, y, 0, 1000, 0, 2, 0, 0);
motion_add(90 + random(45) - random(45), random(3));
image_angle = image_angle - 70 + random(140);