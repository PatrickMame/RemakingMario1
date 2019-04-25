current_camera        = view_camera[0];
current_camera_x      = camera_get_view_x(current_camera) 
current_camera_y      = camera_get_view_y(current_camera)


draw_text(current_camera_x, current_camera_y + 00, "FPS " + string(fps));
draw_text(current_camera_x, current_camera_y + 08, "OBJ " + string(instance_count));
draw_text(current_camera_x, current_camera_y + 16, "On Ground  " + string(obj_player.on_ground));

