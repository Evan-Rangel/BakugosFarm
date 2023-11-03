/// @description Insert description here

if instance_exists(Kirby_Player) 
{
	
	if (Kirby_Player.sprite_index = Kirby_Walk_Right)
	{
		x = Kirby_Player.x + 23;
		sprite_index = spr_watercan1_right;
	}
	
	else
	{
		x = Kirby_Player.x - 23;
		sprite_index = spr_watercan1_left;
	}
	
	y = Kirby_Player.y - 1;
}


