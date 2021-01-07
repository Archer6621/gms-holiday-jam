
// Wipe and create per sesssion
//instance_create(GameManager);
instance_create(LightManager);
//instance_create(StageManager);
//instance_create(AlertManager);
//instance_create(UpgradeManager);
instance_create(RoomManager);
instance_create(ManagerManager);
//show_debug_overlay(true);
window_set_size(display_get_width(),  display_get_height());
window_set_position(0, 0);
global.room_manager.room_goto_transition(main_menu, 0.01, 0.5, c_black, c_white);
