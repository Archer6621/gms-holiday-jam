/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (warping) {
	exit;	
}

event_inherited();
go_left = keyboard_check(vk_left);
go_right =  keyboard_check(vk_right);
go_forward = keyboard_check(vk_up);
go_back = keyboard_check(vk_down);

if (global.upgrade_manager.force_blast_ability.unlocked) {
	do_forceblast = keyboard_check_pressed(ord("Z"));
}

if (global.upgrade_manager.emp_blast_ability.unlocked) {
	do_emp_blast = keyboard_check_pressed(vk_space);	
}

if (global.upgrade_manager.burst_ability.unlocked) {
	do_burst = key_check_double_tap(vk_shift);
}

if (global.upgrade_manager.afterburner_ability.unlocked) {
	use_afterburner = keyboard_check(vk_shift);
}