/// @description Insert description here

var inst = instance_position(mouse_x, mouse_y, obj_hoyo);
if (inst != noone && mouse_check_button_pressed(mb_left) && Kirby_Player.shovel = true) 
{
    if (inst.visible) 
	{
        inst.visible = false; // Oculta el objeto si ya está visible
    } 
	else 
	{
        inst.visible = true; // Muestra el objeto si está oculto
    }
}


