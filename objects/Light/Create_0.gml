/// @description Insert description here
// You can write your code in this editor

// Basic properties
light_color = c_black;
light_radius = 0.0;

index = global.light_manager.register_light();
if (index == undefined) {
	instance_destroy();	
}
