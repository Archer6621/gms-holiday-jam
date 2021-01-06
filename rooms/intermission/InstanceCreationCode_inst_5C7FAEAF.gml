func = function() {
	global.alert_manager.announce(snd_voice_commencing);
	global.game_manager.go_to_next_level();
}

on_hover = function () {
	with (Description) {
		text = "Exit warp to find the next warpzone. NOTE: unspent time and discovered core tech that was not unlocked will go lost!"
	}
}