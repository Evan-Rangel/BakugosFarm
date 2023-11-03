/// @description Insert description here

if instance_exists(Kirby_Player) 
{
    /*if (Kirby_Player.direction == 0 || Kirby_Player.direction == 45 || Kirby_Player.direction == 315) 
    {
        x = Kirby_Player.x + offset; // Ajusta la posición x de la pala a la derecha del jugador
        sprite_index = spr_shovel1_right; // Cambia el sprite de la pala hacia la derecha
    } 
    else if (Kirby_Player.direction == 135 || Kirby_Player.direction == 180 || Kirby_Player.direction == 225)
    {
        x = Kirby_Player.x - offset; // Ajusta la posición x de la pala a la izquierda del jugador
        sprite_index = spr_shovel1_left; // Cambia el sprite de la pala hacia la izquierda
    }
    y = Kirby_Player.y - 10; // Ajusta la posición y de la pala a la posición y del jugador
	
	if (x > Kirby_Player.x + offset)
		{
			x = Kirby_Player.x + offset;
		}
			
	else if (x < Kirby_Player.x - offset)
	{
		x = Kirby_Player.x - offset;
	}*/
	
	if (Kirby_Player.sprite_index = Kirby_Walk_Right)
	{
		x = Kirby_Player.x + 23;
		sprite_index = spr_shovel1_right;
	}
	
	else
	{
		x = Kirby_Player.x - 30;
		sprite_index = spr_shovel1_left;
	}
	
	y = Kirby_Player.y - 10;
}

