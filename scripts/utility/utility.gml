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

function create_proximity_checker(object, distance) {
	var inst = instance_create(ProximityChecker);	
	inst.proximity_dist = distance;
	inst.object = object;
	inst.follow = id;
	return inst;
}

function all_true(conditions, key) {
	if (is_undefined(key)) {
		key = function(cond) {return cond;}	
	}
	var cond = true;
	for (var i = 0; i < array_length(conditions); i += 1) {
		cond = cond and key(conditions[i]);
	}
	return cond;
}

function key_check_double_tap(key) {
	var exists = false;
	if (keyboard_check_pressed(key)) {
		with (DoubleTap) {
			if (self.key == key) {
				exists = true;
				instance_destroy(id);
			}
		}
		if (not exists) {
			var inst = instance_create(DoubleTap);
			inst.key = key;
		}
	}
	return exists;
}

function any_true(conditions, key) {
	if (is_undefined(key)) {
		key = function(cond) {return cond;}	
	}
	var cond = false;
	for (var i = 0; i < array_length(conditions); i += 1) {
		cond = cond or key(conditions[i]);
	}
	return cond;
}

function get(struct, variable, default_value) {
	return variable_struct_exists(struct, variable) ? struct[$variable] : default_value;
}

function merge(struct, override_struct) {
	var original_names = variable_struct_get_names(struct);;
	var names = variable_struct_get_names(override_struct);
	var new_struct = {}
	for (var i = 0; i < array_length(original_names); i += 1) {
		new_struct[$original_names[i]] = struct[$original_names[i]];
	}
	for (var i = 0; i < array_length(names); i += 1) {
		new_struct[$names[i]] = override_struct[$names[i]];
	}
	return new_struct;
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

function conditional_action(action, condition) {
	var trigger = instance_create(ConditionalTrigger);
	trigger.inst = id;
	trigger.cond = condition;
	trigger.func = action;
	return trigger;
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

function instance_create_ui(object_id) {
	return instance_create_depth(0,0,-10, object_id);
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

function array_constant(size, const) {
	array = [];
	array[size - 1] = const;
	for (var i = 0; i < size; i++) {
		array[i] = const;	
	}
	return array;
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
	precision = 10;
	var str = "";
	for (var i = 0; i < argument_count; i++) {
		var v = argument[i]
		//if (is_real(v)) {
		//		v = string_format(v, precision, precision);
		//}
		str += string(v) + " ";	
	}
	show_debug_message(str);
}

// Small convenience functions to use as keys and other things
function exec(func) {
	return func();	
}

function zero() {
	return 0;	
}