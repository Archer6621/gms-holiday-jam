/// @description Insert description here
// You can write your code in this editor
text_to_draw += string_char_at(display_text, string_length(text_to_draw) + 1);
randomize();
audio_play_sound(choose(snd_msg_type), 0, 0);

if (not done()) {
	randomize();
	var symbol = string_char_at(text_to_draw, string_length(text_to_draw));
	
	switch (symbol) {
		case ",": 	alarm_set(0, 3 * display_rate + random(display_rate_variation)); 
					break;
					
		case ".": 	alarm_set(0, 6 * display_rate + random(display_rate_variation)); 
					break;
					
		case "?": 	alarm_set(0, 5 * display_rate + random(display_rate_variation)); 
			break;
					
		case "!": 	alarm_set(0, 4 * display_rate + random(display_rate_variation)); 
			break;
					
		default:	alarm_set(0, display_rate + random(display_rate_variation)); 
	}

}