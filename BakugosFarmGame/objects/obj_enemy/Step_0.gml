/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if(dead)
{
	sprite_index = spr_light;
	speed = 0;
}
else
{
	direction = point_direction(x,y, obj_char.x, obj_char.y);
	speed = random_range(0.5, 1.5);

	if(direction >90 && direction <270)
	{
		image_xscale = 1;
	}
	else
	{
		image_xscale = -1;
	}
}




