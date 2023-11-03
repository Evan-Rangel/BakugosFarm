/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if(alpha <= 0.70)
{
	alpha += 0.01;
	alarm[0] = 1;
}
else if (alpha >= 0.70)
{
	alarm[1] = 60*night;
}



