instance_create(GameManager);
instance_create(LightManager);
instance_create(StageManager);
instance_create(AlertManager);
show_debug_overlay(true);
window_set_size(1920, 1080);
window_set_position(0, 0);
room_goto_next();
//global.game_manager.go_to_next_level();