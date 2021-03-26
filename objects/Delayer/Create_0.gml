/// @description Insert description here
// You can write your code in this editor
event_inherited();
func = undefined;
// For now 10 will be fine
args = [undefined, undefined, undefined, undefined];
function start(delay) {
	d_alarm_set(0, max(1, delay));
}