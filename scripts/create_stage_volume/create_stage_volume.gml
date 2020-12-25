/// @function create_stage_volume(object_array, vol_start, vol_end, vol_transition, density);
/// @param {array} object_array 
/// @param {real}  vol_start 
/// @param {real}  vol_end 
/// @param {real}  vol_transition 
/// @param {real}  density Density per screen
function create_stage_volume(object_array, vol_start, vol_end, vol_transition, density, env_layers) {
	var volume = instance_create_depth(0, 0, 0, StageVolume);
	volume.vol_start = vol_start;
	volume.vol_end = vol_end;
	volume.objects = object_array;
	volume.vol_transition = vol_transition;
	volume.density = density;
	volume.env_layers = env_layers;
}