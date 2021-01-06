create_count(
	id,
	function() {return global.upgrade_manager.upgrade_credits},
	function() {return 0},
	sprite_width / 2,
	sprite_height / 2,
	true,
	new Label("TIME UNITS REMAINING", true)
)

on_hover = function () {
	with (Description) {
		text = "When the ship warps, time slows down within the warp bubble, giving you valuable moments to prepare the ship for the next area. Hence, spend all the time you can, because you won't get to keep it!"
	}
}