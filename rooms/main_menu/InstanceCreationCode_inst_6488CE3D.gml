func = function() {
	var difficulty = "";
	with (Toggle) {
		if (enabled) {
			difficulty = text; 	
		}
	}
	
	global.manager.create_game_managers();
	switch(difficulty) {
		case "easy":		global.game_manager.difficulty_scaling = 0.6; break;
		case "medium":		global.game_manager.difficulty_scaling = 0.8; break;
		case "hard":		global.game_manager.difficulty_scaling = 1.0; break;
	}
	print(difficulty, global.game_manager.difficulty_scaling)
	
	global.room_manager.room_goto_transition(intermission, 0.75, 0.75);
}

text = "BEGIN"

on_hover = function () {
	with (Description) {
		
		text = choose(
			"Escape the SUPERNOVA!",
			"Lets GOOOOOO!"
		)
	}
}

sprite_index = spr_glass_3;
image_alpha = 0.5;