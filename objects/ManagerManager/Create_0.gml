/// @description Insert description here
// You can write your code in this editor
global.manager = id;
global.frames = 0;
game_managers = [GameManager, LightManager, StageManager, AlertManager, UpgradeManager]
depth = -100000;
queued_destroy = false;
won = false;
lost = false;

function create_game_managers() {
	for (var i = 0; i < array_length(game_managers); i += 1) {
		instance_create(game_managers[i])	
	}
	
}

function destroy_game_managers() {
	for (var i = 0; i < array_length(game_managers); i += 1) {
		with (game_managers[i]) {
			instance_destroy();
		}
	}
}

function destroy_game_managers_next_room() {
	queued_destroy = true;
}