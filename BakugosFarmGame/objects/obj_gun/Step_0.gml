/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

x = obj_char.x;
y = obj_char.y;

image_angle = point_direction(obj_char.x, obj_char.y, mouse_x, mouse_y);

if(image_angle > 0 && image_angle < 180)
{
	layer = layer_get_id("gunback");
}
else
{
	layer = layer_get_id("gunfront");
}
