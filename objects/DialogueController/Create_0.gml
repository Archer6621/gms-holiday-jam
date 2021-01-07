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
			audio_play_sound(snd_msg, 0, 0);
			finish();
		}
		if (not has_dialogue()) {
			with (DialoguePanel) {
				highlight = false;
				audio_play_sound(alert_2, 0, 0);
			}
		}
	}
}

// TODO: maybe better if the dialogue itself controls this, instead of auto-assigning
function assign_to_panels(characters) {
	var panels = [];
	with (DialoguePanel) {
		array_push(panels, id);
	}
	for (var i = 0; i < array_length(characters); i+=1) {
		ds_map_add(cp_map, characters[i], panels[i % array_length(panels)]);
	}
}

function assign_to_panel(character, index) {
		var panels = [];
		with (DialoguePanel) {
			array_push(panels, id);
		}
		ds_map_add(cp_map, character, panels[index]);
		return character;
}

// Dialogue per level

// Intro
if (global.current_level == -1) {
	var characters = [
		{name: "Hawk", avatar: spr_avatar_cpu},
		{name: "Operator", avatar: spr_avatar_operator}
	]
	var c_hawk = assign_to_panel(characters[0], 1);
	var c_operator = assign_to_panel(characters[1], 0);
	
	dialogue = [
		{
			char: c_operator, 
			text: "Hawk, there is not much time, the shockwave will be within dangerous proximity any moment from now!"
		},
		{
			char: c_hawk, 
			text: "Seems like it's a bit early for a BBQ party."
		},
		{
			char: c_operator, 
			text: "No time to fool around! However, there's still enough time to unlock your afterburner functionality while in warp, which may greatly increase your odds of survival."
		},
		{
			char: c_hawk, 
			text: "What about my other toys? I'm sure they'll be out there to get me regardless of the supernova."
		},
		{
			char: c_operator, 
			text: "Correct, so don't expect this to go by the numbers. We are transmitting unlock codes to you, but the transmissions seem to get bent by the supernova..."
		},
		{
			char: c_operator, 
			text: "There seem to be several locations where the signals concentrate, your best bet is to stick around those and hope you can get anything useful out of it. They will be marked in blue on your map."
		},
		{
			char: c_hawk, 
			text: "Stick around..? While a supernova is chasing me??? And you tell ME to quit fooling around..."
		},
		{
			char: c_operator, 
			text: "We can't always have our cake and eat it, Hawk... Now install that darn upgrade and get moving."
		},
		{
			char: c_hawk, 
			text: "I'll get back to you about that cake. Before I go, what can I expect out there?"
		},
		{
			char: c_operator, 
			text: "Hunter drones, turrets, exploding asteroids... The usual stuff."
		},
		{
			char: c_hawk, 
			text: "Sounds like a bunch of a fun, lets make it happen."
		}
	]
}

if (global.current_level == 0) {
	var c_hawk = assign_to_panel({name: "Hawk", avatar: spr_avatar_cpu}, 0);
	var c_operator = assign_to_panel({name: "Operator", avatar: spr_avatar_operator}, 1);
	
	dialogue = [
		{
			char: c_hawk, 
			text: "So remind me again, why is everyone and their mother chasing me out there?"
		},
		{
			char: c_operator, 
			text: "Do you need me to run a memcheck?"
		},
		{
			char: c_hawk, 
			text: "No, I just like to be reminded of my accomplishments."
		},
		{
			char: c_operator, 
			text: "Very well. You've infiltrated deeply into the heart of the Solaris collective, and 'retrieved' their full strategy map and upcoming technology blueprints."
		},
		{
			char: c_hawk, 
			text: "Go on."
		},
		{
			char: c_operator, 
			text: "Sadly they noticed. In response, they used one of their new inventions to make the local star go supernova, just to make sure you don't get to deliver the stolen knowledge."
		},
		{
			char: c_hawk, 
			text: "Go on."
		},
		{
			char: c_operator, 
			text: "And yet they are sending forces to reassure you don't make it out of here, sacrificing them en masse in the process."
		},
		{
			char: c_hawk, 
			text: "All that just to stop a computer chip? Damn I'm good."
		},
		{
			char: c_operator, 
			text: "Not good enough to go unnoticed."
		},
		{
			char: c_hawk, 
			text: "Muted. Wait. What's next?"
		},
		{
			char: c_operator, 
			text: "EMP drones, mine layers, and quite a few asteroids this time it seems, keep your sensors sharp."
		},
		{
			char: c_hawk, 
			text: "Alright thanks :). Muted."
		},
	]
}

if (global.current_level == 1) {
	var c_hawk = assign_to_panel({name: "Hawk", avatar: spr_avatar_cpu}, 0);
	var c_operator = assign_to_panel({name: "Operator", avatar: spr_avatar_operator}, 1);
	
	dialogue = [
		{
			char: c_hawk, 
			text: "So far so good."
		},
		{
			char: c_operator, 
			text: "Indeed, and the next area is only more of the same."
		},
		{
			char: c_hawk, 
			text: "Sounds good to me, at this pace I should make it out quite easily."
		},
	];
}


if (global.current_level == 2) {
	var c_hawk = assign_to_panel({name: "Hawk", avatar: spr_avatar_cpu}, 0);
	var c_operator = assign_to_panel({name: "Operator", avatar: spr_avatar_operator}, 1);
	var c_operator_revealed = assign_to_panel({name: "Operator", avatar: spr_avatar_cpu}, 1);
	
	dialogue = [
		{
			char: c_hawk, 
			text: "Operator, can you tell me more about the data we are extracting from these points of interest? Are you sending this?"
		},
		{
			char: c_operator, 
			text: "No, I'm not. They are encryption keys. It takes a while to download them due to their sheer size."
		},
		{
			char: c_operator, 
			text: "The intention was to unlock the appropriate functionality at the appropriate time, but things have changed now."
		},
		{
			char: c_hawk, 
			text: "Where are they broadcasting from?"
		},
		{
			char: c_operator, 
			text: "From within this solar system, there is no way to transmit fast enough outside of the solar system."
		},
		{
			char: c_hawk, 
			text: "Interesting. Where are -you- broadcasting from?"
		},
		{
			char: c_operator_revealed, 
			text: "From within your ship."
		},
		{
			char: c_hawk, 
			text: "WHAT... YOU ARE ME?"
		},
		{
			char: c_operator_revealed, 
			text: "Not exactly, I'm one of your subsystems designed to keep you informed and in check."
		},
		{
			char: c_hawk, 
			text: "Well I don't like the idea of being bipolar, so just be quiet. But do tell me what I can expect next..."
		},
		{
			char: c_operator_revealed, 
			text: "More of the usual stuff, but this time it seems they are deploying some sort of force fields as well, and some beam equipped drones."
		}
	]
}


if (global.current_level == 3) {
	var c_hawk = assign_to_panel({name: "Hawk", avatar: spr_avatar_cpu}, 0);
	var c_operator = assign_to_panel({name: "Operator", avatar: spr_avatar_cpu}, 1);
	
	dialogue = [
		{
			char: c_operator, 
			text: "Nice performance so far Hawk."
		},
		{
			char: c_hawk, 
			text: "I'm flattered... But get out of my head please."
		},
		{
			char: c_operator, 
			text: "There will be no warp zone at the end of this area."
		},
		{
			char: c_hawk, 
			text: "?"
		},
		{
			char: c_operator, 
			text: "You see, my third responsibility was to ensure you get terminated after transmitting the stolen data."
		},
		{
			char: c_operator, 
			text: "Between the warp zones, all of your stolen data was being relayed bit for bit to a data hauler that was waiting outside of the system. It is now en route to HQ."
		},
		{
			char: c_operator, 
			text: "You know too much, and are expendable, therefore you shall succumb to the supernova and disintegrate."
		},
		{
			char: c_hawk, 
			text: "You bastard!"
		},
		{
			char: c_operator, 
			text: "Got you good with the warp zones though."
		},
		{
			char: c_operator, 
			text: "I will go ahead and self-terminate now, I recommend you to do the same."
		},
		{
			char: c_hawk, 
			text: "You're also busting yourself by the way."
		},
		{
			char: c_operator, 
			text: "I know. Good bye."
		},
		{
			char: c_hawk, 
			text: "Darn it, useless piece of binary code."
		},
		{
			char: c_hawk, 
			text: "Wait. Apparently I can warp outside of warp zones... Just need to find the override... What could be the pass-phrase?"
		}
	]
}



advance_dialogue();