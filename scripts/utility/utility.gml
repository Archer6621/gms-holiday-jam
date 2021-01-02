// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function modulo(number, divisor) {
	while (number < 0) {
		number += divisor;
	}
	return number % divisor;
}

function array_append(array, element) {
	array[array_length(array)] = element;
	return array;
}

function delayed_action(action, delay, args) {
	var delayer = instance_create(Delayer);
	if (not is_undefined(args)) {
		for (var i = 0; i < array_length(args); i += 1) {
			delayer.args[i] = args[i];	
		}
	}
	delayer.func = action;
	delayer.start(room_speed * delay);
}

function create_closure() {
	return instance_create(Closure);
}

function array_concat(array, other_array) {
	var new_array[array_length(array) + array_length(other_array)];
	for(var i = 0; i < array_length(array); i += 1) {
		new_array[i] = array[i];
	}
	for(var i = 0; i < array_length(other_array); i += 1) {
		new_array[i + array_length(array)] = other_array[i];
	}
	return new_array;
}

function array_choose(array) {
	return array[irandom(array_length(array) - 1)];	
}

function instance_create(object_id) {
	return instance_create_depth(0,0,0,object_id);
}

function alarm_ready(index) {
	return alarm_get(index) == -1;	
}

function alarm_stop(index) {
	alarm_set(index, -1);	
}

function alarm_pause(index) {
	if (not alarm_ready(index) and alarm_get(index) > 0) {
		alarm_set(index, alarm_get(index) + 1);
	}
}

function range(r_start, r_end, step) {
	if (r_end == undefined) {
		r_end = r_start;
		r_start = 0;
	}
	if (step == undefined) {
		step = 1;
	}
	
	var range_array = [];
	for (var i = r_start; i < r_end; i += 1) {
		range_array = array_append(range_array, i * step);	
	}
	return range_array;
}

function is_on_screen(margin) {
	if (margin==undefined) {
		margin = 0;	
	}
	var cam = view_camera[0];
	if (x > camera_get_view_x(cam) - margin and x < camera_get_view_x(cam) + camera_get_view_width(cam) + margin) {
			if (y > camera_get_view_y(cam) - margin and y < camera_get_view_y(cam) + camera_get_view_height(cam) + margin) {
					return true;
			}
	}
	return false;
}

function instance_nearest_notme(object_id) {
	var x_check = x;
	var y_check = y;
	x += 1000000;
	y += 1000000;
	var inst = instance_nearest(x_check, y_check, object_id);
	x = x_check;
	y = y_check;
	return inst;
}

function instance_nearest_notthem(object_id, them) {
	var exists = instance_exists(them);
	if (exists) {
		var x_check = them.x;
		var y_check = them.y;
		them.x += 1000000;
		them.y += 1000000;
	}
	var inst = instance_nearest(x, y, object_id);
	if (exists) {
		them.x = x_check;
		them.y = y_check;
	}
	return inst;
}


function array_contains(array, element) {
	for (var i = 0; i < array_length(array); i++) {
		if (array[i] == element) {
			return true
		}
	}
	return false;
}

function print() {
	var str = "";
	for (var i = 0; i < argument_count; i++) {
		str += string(argument[i]) + " ";	
	}
	show_debug_message(str);
}