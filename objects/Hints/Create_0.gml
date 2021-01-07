/// @description Insert description here
// You can write your code in this editor
text = "";

image_alpha = 0;

margin = 10;
prefix = "HINT: ";
hints = [
	"The shockwave has a chance to destroy objects on hit, so it is usually calmer within the shockwave!",
	"Succesfully receiving data while fleeing from the supernova grants you one additional time unit to spend.",
	"Managing to warp outside of the shockwave will also yield one additional time unit.",
	"Explosions can disrupt your ship, try to avoid them.",
	"EMP will drain all your power and disable your reactor for a moment.",
	"Drones will follow you around no matter where you go and explode on impact, try to juke them around asteroids.",
	"Most objects instantly get disabled by the shockwave, but some like yourself and purple drones can continue to operate for some time.",
	"The shockwave pushes anything it hits and modifies directions a bit as well.",
	"The shockwave will slowly eat away at your hull while you're inside of it, unless you've upgraded towards immunity.",
	"Data collection points are marked on the minimap as aqua-colored dots.",
	"On higher difficulties you'd like to plan ahead if you intend to collect data, starting to receive while in the shockwave might be too late already.",
	"You can actually still warp when your hull integrity has failed, as long as you have some energy left.",
	"Colliding with things, running into explosions, and getting shot, will all result in malfunctions that stall you."
]

function set_hint() {
	randomize();
	var chosen = array_choose(hints);
	if (array_length(hints) > 1) {
		while (prefix + chosen == text) {
			chosen = array_choose(hints);
		}
	}
	text = prefix + chosen;
	
	alarm_set(0, ceil(10 * string_length(text) * room_speed * 0.01));
	image_alpha = 0.2;
}

set_hint();
