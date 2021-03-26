// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function d_alarm_get(index){
	return d_alarm[index];
}

function d_alarm_get_safe(index) {
	return is_undefined(d_alarm[index]) ? -1 : d_alarm[index] 	
}

function d_alarm_set(index, value){
	d_alarm[index] = value;
}