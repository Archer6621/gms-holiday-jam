func = function() {
	game_end();
}

text = "exit";

on_hover = function () {
	with (Description) {
		randomize();
		text = choose(
			"Don't even think about it...",
			"I guess you got.. ROASTED",
			"Hope that's not a rage quit",
			"But wouldn't you want to know how it ends?",
			"Hey, don't touch that button!",
			"No no no, you're supposed to click 'BEGIN'."
		);
	}
}

sprite_index = spr_glass_3;
image_alpha = 0.5;