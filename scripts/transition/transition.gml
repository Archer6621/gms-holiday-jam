/// @function transition(input, zone_start, zone_end, zone_transition);
/// @param {real}  input 
/// @param {real}  zone_start 
/// @param {real}  zone_end 
/// @param {real}  zone_transition
function transition(in, s, e, t){
	return clamp((1/t)*(in - s), 0, 1) - clamp((1/t)*(in - e + t), 0, 1)
}