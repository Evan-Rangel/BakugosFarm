/// @description Insert description here

/*-------Desactivar otras herramientas-----*/

//Espada
	sword = false;
	instance_deactivate_object(obj_sword1);
	
//Pala
	shovel = false;
	instance_deactivate_object(obj_shovel1);
	
//Asada
	hoe = false;
	instance_deactivate_object(obj_hoe1);

/*------------------------------------------------------------------------------*/


if (!watercan)
{
	instance_activate_object(obj_watercan1);
	watercan = true;
}

else
{
	watercan = false;
	instance_deactivate_object(obj_watercan1);
}


