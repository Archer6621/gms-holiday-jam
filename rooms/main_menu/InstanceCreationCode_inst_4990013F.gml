text = "hard";
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
		text = choose(
			"Remember, no flying while talking.",
			"The way it's meant to be played!",
			"This is gonna be rough."
		);
	}
}

sprite_index = spr_glass_3;
image_alpha = 0.5;