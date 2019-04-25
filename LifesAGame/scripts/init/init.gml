//SET DEFAULT GAME SPEED
	game_set_speed(60, gamespeed_fps);

//CREATE GUI OBJECT
	instance_create_depth(0,0,-4096, obj_gui);

//GOTO NEXT ROOM
	room_goto_next();