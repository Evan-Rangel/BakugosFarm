/// @description Insert description here

if instance_exists(Kirby_Player) 
{
	
	if (Kirby_Player.sprite_index = Kirby_Walk_Right)
	{
		x = Kirby_Player.x + 23;
		sprite_index = spr_sword1_right;
	}
	
	else
	{
		x = Kirby_Player.x - 23;
		sprite_index = spr_sword1_left;
	}
	
	y = Kirby_Player.y - 10;
}


