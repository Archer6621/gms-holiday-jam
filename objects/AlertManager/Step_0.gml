/// @description Insert description here
// You can write your code in this editor

if (current_message != display_message and alarm_ready(0)) {
	randomize();
	alarm_set(0, display_rate + random(display_rate_variation));
}

if (current_message == display_message and alarm_ready(2) and not fade) {
	alarm_set(2, fade_after * room_speed);
}

if (image_alpha <= 0 and fade) {
	ready = true;
}

if (ready and not ds_queue_empty(notification_queue)) {
		var notification_data = ds_queue_dequeue(notification_queue);
		show_notification(notification_data[0], notification_data[1], notification_data[2]);
		ready = false;
}