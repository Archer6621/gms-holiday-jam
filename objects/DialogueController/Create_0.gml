/// @description Insert description here
// You can write your code in this editor


cp_map = ds_map_create();
dialogue = [];
dialogue_pointer = 0;

function has_dialogue() {
	return dialogue_pointer < array_length(dialogue);
}

function get_next_dialogue() {
	var next = dialogue[dialogue_pointer];
	dialogue_pointer += 1;
	return next;
}

function all_done() {
	var d = true;
	with (DialoguePanel) {
		d = d and done()
	}
	return d;
}

function advance_dialogue() {
	if (has_dialogue() and all_done()) {
		with (DialoguePanel) {
			highlight = false;	
		}
		var current = get_next_dialogue();
		var panel = ds_map_find_value(cp_map, current.char);
	
		with (panel) {
			show_dialogue(current.char, current.text);
		}
	} else {
		with (DialoguePanel) {
			audio_play_sound(snd_msg, 0, 0)
			finish();
		}
	}
}

function assign_to_panels(characters) {
	var panels = [];
	with (DialoguePanel) {
		array_push(panels, id);
	}
	for (var i = 0; i < array_length(characters); i+=1) {
		ds_map_add(cp_map, characters[i], panels[i % array_length(panels)]);
	}
}

// Dialogue per level

// Intro
if (global.current_level == -1) {
	var characters = [
		{name: "Hawk", avatar: spr_hawk},
		{name: "Operator", avatar: spr_ability_placeholder}
	]
	var c_hawk = characters[0];
	var c_operator = characters[1];

	assign_to_panels(characters);
	
	dialogue = [
		{
			char: c_operator, 
			text: "Hawk, there is not much time, the shockwave will be within dangerous proximity any moment from now!"
		},
		{
			char: c_hawk, 
			text: "And what's the good news?"
		},
		{
			char: c_operator, 
			text: "No time to fool around. There's still enough time to unlock your afterburner functionality though, which may increase your survival odds tremendously."
		},
		{
			char: c_hawk, 
			text: "What about my other toys? I'm sure they'll be out to get me regardless of that supernova."
		},
		{
			char: c_operator, 
			text: "Correct, so don't expect this to go by the numbers. The transmitters for the unlock codes are within the system, but their transmissions seem to get bent by the supernova..."
		},
		{
			char: c_operator, 
			text: "There seem to be several locations where the signals concentrate, your best bet is to stick around those and hope you can get anything useful out of it."
		},
		{
			char: c_hawk, 
			text: "Stick around..? While a supernova is chasing me??"
		},
		{
			char: c_operator, 
			text: "We can't always have it all, Hawk... Now install that upgrade and get moving."
		}
	]
}


advance_dialogue();