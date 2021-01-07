/// @description Insert description here
// You can write your code in this editor
audio_falloff_set_model(audio_falloff_exponent_distance);
if (vaporize_shockwave and in_shockwave) {
	audio_play_sound_at(vaporize, x, y, 0, 1000, 0, 2, 0, 0);
	//create_spark(c_white, x, y, 0.5 * image_xscale, true);
	repeat(1) {
		create_debris(c_white, random_around(x, 0.1 * sprite_width), random_around(y, 0.1 * sprite_height), 0.5 * image_xscale + 0.25 * random(image_xscale), true);
	}
} else {
	create_clustered_explosion(x, y, image_xscale, 6, 0.4);
	audio_play_sound_at(choose(explosion_1, explosion_2), x, y, 0, 1000, 0, 2, 0, 0);
}	