func = function () {
	global.persistent_integrity = global.game_manager.hawk_max_integrity;
	global.alert_manager.announce(snd_voice_ship_repaired);
	global.upgrade_manager.upgrade_credits -= 1;
}

clickable = function () {
	var conditions = [
		global.upgrade_manager.upgrade_credits > 0,
		global.persistent_integrity < global.game_manager.hawk_max_integrity
	];
	return all_true(conditions);
}

var bar_height = 15;
var margin = 5;
create_bar(
	id, 
	function () {return global.persistent_integrity}, 
	function () {return false}, 
	0, 
	global.game_manager.hawk_max_integrity,
	sprite_width / 2,
	sprite_height + bar_height / 2 + margin,
	sprite_width,
	bar_height,
	[c_teal],
	true,
	false,
	new Label("HULL INTEGRITY", true)
)

on_hover = function () {
	with (Description) {
		text = "Repair your ship, at the cost of one time unit."
	}
}