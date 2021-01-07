// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_clustered_explosion(xx, yy, scale, count, spread, type, colors){
	type = is_undefined(type) ? Explosion : type;
	colors = is_undefined(colors) ? [c_orange, c_red] : colors
	create_decaying_light(xx, yy, colors[0], colors[1], scale * 200, 0.5, 3.5);
	var central = instance_create_depth(xx, yy, -1, type);
	central.image_xscale = scale;
	central.image_yscale = scale;
	central.image_angle = random(360);
	for (var i = 0; i < count; i += 1) {
		var side = instance_create_depth(xx, yy, 1, DummyExplosion);
		side.image_xscale = 0.5 * scale;
		side.image_yscale = side.image_xscale;
		side.image_angle = random(360);
		side.sprite_index = object_get_sprite(type);
		side.image_index = irandom(side.image_number/2);
		side.x = side.x - spread * (central.sprite_width/2 - random(central.sprite_width));
		side.y = side.y - spread * (central.sprite_height/2 - random(central.sprite_height));
	}
}

function create_colored_explosion(xx, yy, scale, color, decay_color){
	if (decay_color == undefined) {
		decay_color = color;	
	}
	create_decaying_light(xx, yy, color, decay_color, 200, 0.5, 3.5);
	var central = instance_create_depth(xx, yy, -2, Explosion);
	central.image_xscale = scale;
	central.image_yscale = scale;
	central.image_angle = random(360) + 180;
	central.image_alpha = 1.0;
	central.image_blend = merge_colour(color, decay_color, random(1));
	central.sprite_index = spr_explosion;
	central.blend_mode = bm_add;
	
	var secondary = instance_create_depth(xx, yy, -2, DummyExplosion);
	secondary.image_xscale =  0.8 * scale;
	secondary.image_yscale =  0.8 * scale;
	secondary.image_angle = random(360) + 270;
	secondary.image_blend = merge_colour(color, decay_color, 0.2);
	central.image_alpha = 0.75;
	secondary.sprite_index = spr_explosion_white;
	secondary.blend_mode = bm_add;
}

function create_spark(color, xx, yy, scale, follow) {
	create_decaying_light(xx, yy, color, color, 50, 0.5, 1.0);
	var spark = instance_create_depth(xx, yy, -1, Spark);
	if (follow) {
		spark.following = self.id;	
	}
	spark.image_blend = color;
	spark.image_xscale = scale;
	spark.image_yscale = scale;
	spark.image_angle = random(360);	
}

function create_debris(color, xx, yy, scale, follow) {
	var debris = instance_create_depth(xx, yy, -1, Debris);
	if (follow) {
		debris.following = self.id;	
	}
	debris.image_blend = color;
	debris.image_xscale = scale;
	debris.image_yscale = scale;
	debris.image_angle = random(360);	
}
