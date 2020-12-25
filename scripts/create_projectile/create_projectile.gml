// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_projectile(xx, yy, object_id){
	var projectile = instance_create_depth(xx, yy, self.depth + 1, object_id)
	projectile.image_angle = self.image_angle;
	projectile.blacklist = [self.id];
	return projectile;
}