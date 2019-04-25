var t_set      = argument0;
var j_set      = argument1;
var x_off      = argument2;
var y_off      = argument3;

var tile_data  = -1; 
var tile_index = 0;
var collided = false


tile_data = tilemap_get_at_pixel(t_set, bbox_left + x_off, bbox_top + y_off);
tile_index = tile_get_index(tile_data); 
collided = collided or tile_index > 0;

tile_data  = tilemap_get_at_pixel(t_set, bbox_right + x_off, bbox_top + y_off);
tile_index = tile_get_index(tile_data); 
collided = collided or tile_index > 0;

tile_data = tilemap_get_at_pixel(t_set, bbox_left + x_off, bbox_bottom + y_off);
tile_index = tile_get_index(tile_data); 
collided = collided or tile_index > 0;

tile_data = tilemap_get_at_pixel(t_set, bbox_right + x_off, bbox_bottom + y_off);
tile_index = tile_get_index(tile_data); 
collided = collided or tile_index > 0;

#region JUMP THRU CODE
	if y_off > 0 then {
		var tile_temp = [];
		tile_temp[0] = tilemap_get_at_pixel(j_set, bbox_left , bbox_bottom - y_off);
		tile_temp[1] = tilemap_get_at_pixel(j_set, bbox_right, bbox_bottom - y_off);
		tile_temp[2] = tilemap_get_at_pixel(j_set, bbox_left , bbox_bottom + y_off);
		tile_temp[3] = tilemap_get_at_pixel(j_set, bbox_right, bbox_bottom + y_off);

		tile_temp[0] = tile_get_index(tile_temp[0]) > 0;
		tile_temp[1] = tile_get_index(tile_temp[1]) > 0;
		tile_temp[2] = tile_get_index(tile_temp[2]) > 0;
		tile_temp[3] = tile_get_index(tile_temp[3]) > 0;

		collided = collided or (not (tile_temp[0] or tile_temp[1]) and (tile_temp[2] or tile_temp[3]));
	}//end if
#endregion


return collided;