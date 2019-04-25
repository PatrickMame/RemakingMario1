current_camera        = -1;
current_camera_x      = -1;
current_camera_y      = -1;
current_camera_width  = -1;
current_camera_height = -1; 

var lay_id = layer_get_id("Collision");
Collision = layer_tilemap_get_id(lay_id);
var lay_id = layer_get_id("Jumpthrough");
Jumpthrough = layer_tilemap_get_id(lay_id);