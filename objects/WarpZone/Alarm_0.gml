/// @description Insert description here
// You can write your code in this editor

if (global.manager.won) {
	global.game_manager.end_session_win();
} else {
	global.room_manager.room_goto_transition(intermission, 2.0, 0.75, c_white);	
}
