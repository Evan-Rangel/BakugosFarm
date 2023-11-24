//movement
hInput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
vInput = keyboard_check(ord("S")) - keyboard_check(ord("W"));



if(hInput != 0 or vInput !=0){
	dir=point_direction(0,0,hInput,vInput);
	moveX = lengthdir_x(spd,dir);
	moveY = lengthdir_y(spd,dir);

	x += moveX;
	y += moveY;
	
	//set sprite
	switch(dir){
		case 0: sprite_index = spr_r; break;
		case 45: sprite_index = spr_ur; break;
		case 90: sprite_index = spr_u; break;
		case 135: sprite_index = spr_ul; break;
		case 180: sprite_index = spr_l; break;
		case 225: sprite_index = spr_dl; break;
		case 270: sprite_index = spr_d; break;
		case 315: sprite_index = spr_dr; break;
	}
		
}else{
	image_index = 0;
}

if (place_meeting(x, y, obj_espada)) {
    if (mouse_check_button_pressed(mb_left)) {
        // El objeto de la espada está encima del jugador y se hizo clic izquierdo
        // Reproduce la animación de ataque
        sprite_index = spr_ataque; // Reemplaza "spr_ataque" con el nombre de tu sprite de ataque
        image_speed = 1; // Ajusta la velocidad de la animación según sea necesario
        // Puedes agregar más lógica aquí según tus necesidades
    }
}
/*
cd --;
if(cd <- 0 && mouse_check_button(mb_left))
{
	cd = cdValue;
	with(instance_create_layer(x,y, "bullets", obj_bullet))
	{
		direction = obj_gun.image_angle;
		speed = 8;
	}
}
//set sprite
*/