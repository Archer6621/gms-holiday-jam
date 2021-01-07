text = "easy";
scale = 1;

state = function() {
	return enabled;	
}

func = function() {
	with (Toggle) {
		enabled = false;	
	}
	enabled = not enabled;	
}

on_hover = function () {
	with (Description) {
		randomize();
		text = choose(
			"Get outta here, who plays games on easy?",
			"Really?",
			"Come on, try harder, you can do it!"
		);
	}
}

sprite_index = spr_glass_3;
image_alpha = 0.5;