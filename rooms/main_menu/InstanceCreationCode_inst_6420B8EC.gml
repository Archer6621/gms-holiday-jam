text = "medium";
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

func();

on_hover = function () {
	with (Description) {
		
		text = choose(
			"Your average dose of carnage.",
			"Just the right amount of mayhem.",
			"Balanced as all things should be."
		);

	}
}

sprite_index = spr_glass_3;
image_alpha = 0.5;