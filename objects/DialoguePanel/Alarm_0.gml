/// @description Insert description here
// You can write your code in this editor
text_to_draw += string_char_at(display_text, string_length(text_to_draw) + 1);
randomize();
audio_play_sound(choose(snd_msg_type), 0, 0);

if (not done()) {
	randomize();
	alarm_set(0, display_rate + random(display_rate_variation));	
}