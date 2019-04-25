#region UPDATE CAMERA 
	current_camera        = view_camera[0];
	current_camera_x      = camera_get_view_x(current_camera) 
	current_camera_y      = camera_get_view_y(current_camera) 
	current_camera_width  = camera_get_view_width(current_camera) 
	current_camera_height = camera_get_view_height(current_camera) 

	if obj_player.x > current_camera_x + current_camera_width then {
		camera_set_view_pos(current_camera, current_camera_x + current_camera_width, current_camera_y);
		current_camera_x = camera_get_view_x(current_camera)
		room_changed = true;
	}

	if obj_player.x < current_camera_x then {
		camera_set_view_pos(current_camera, current_camera_x - current_camera_width, current_camera_y);
		current_camera_x = camera_get_view_x(current_camera) 
		room_changed = true;		
	}

	if obj_player.y > current_camera_y + current_camera_height then {
		camera_set_view_pos(current_camera, current_camera_x, current_camera_y + current_camera_height);
		current_camera_y = camera_get_view_y(current_camera) 	
		room_changed = true;		
	}

	if obj_player.y < current_camera_y then {
		camera_set_view_pos(current_camera, current_camera_x, current_camera_y - current_camera_height);
		current_camera_y = camera_get_view_y(current_camera)
		room_changed = true;		
	}
#endregion