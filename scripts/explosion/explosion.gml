// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_clustered_explosion(xx, yy, scale, count, spread){
	create_decaying_light(xx, yy, c_orange, c_red, 200, 0.5);
	var central = instance_create_depth(xx, yy, 1, Explosion);
	central.image_xscale = scale;
	central.image_yscale = scale;
	central.image_angle = random(360);
	for (var i = 0; i < count; i += 1) {
		var side = instance_create_depth(xx, yy, 1, Explosion);
		side.image_xscale = 0.5 * scale;
		side.image_yscale = side.image_xscale;
		side.image_angle = random(360);
		side.image_index = irandom(side.image_number/2);
		side.x = side.x - spread * (central.sprite_width/2 - random(central.sprite_width));
		side.y = side.y - spread * (central.sprite_height/2 - random(central.sprite_height));
	}
}