/// @description Movimmiento
// Movimientos del personaje

horizontal = 0;
vertical = 0;

if keyboard_check(ord("D"))
{
    horizontal += 1;
}

if keyboard_check(ord("A"))
{
    horizontal -= 1;
}

if keyboard_check(ord("W"))
{
    vertical -= 1;
}

if keyboard_check(ord("S"))
{
    vertical += 1;
}

// Verificar dirección y velocidad

if (horizontal != 0 || vertical != 0)
{
    direction = point_direction(0, 0, horizontal, vertical);
    speed = v;
    image_speed = 1;
}
else
{
    speed = 0;
    image_speed = 0;
    image_index = 0;
}

// Asignar sprite según la dirección
switch(direction)
{
	case 315:
	case 45:
    case 0:
        sprite_index = Kirby_Walk_Right;
        break;

	case 225:
	case 135:
    case 180:
        sprite_index = Kirby_Walk_Left;
        break;

}
