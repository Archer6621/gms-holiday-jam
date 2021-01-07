/// @description Insert description here
// You can write your code in this editor

// Apparently the objects in the previous room are still active... So we need to set an alarm
if (queued_destroy) {
	destroy_game_managers();
	queued_destroy = false;
}

if (room==main_menu) {
	with (Panel) {
		if (text=="SUPERNOVA") {
			if (other.won) {
				text = "THANK YOU!";
				other.won = false;
			}
			if (other.lost) {
				text = "TRY AGAIN!";
				other.lost = false;
			}
			delayed_action(function (inst_id){inst_id.text = "SUPERNOVA"}, 5.0, [id]);
		}
	}
	
}