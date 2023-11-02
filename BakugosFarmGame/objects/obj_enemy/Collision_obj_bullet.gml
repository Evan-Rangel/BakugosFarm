/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if(!dead)
{
	//audio_play_sound(aDeath, 1, false);
	dead = true;
	layer = layer_get_id("bodies");
	instance_destroy(other);
}


