/// @description Insert description here

/*-------Desactivar otras herramientas-----*/

//Espada
	sword = false;
	instance_deactivate_object(obj_sword1);
	
//Asada
	hoe = false;
	instance_deactivate_object(obj_hoe1);
	
//Regadera
	watercan = false;
	instance_deactivate_object(obj_watercan1);
	
/*------------------------------------------------------------------------------*/


if (!shovel)
{
	instance_activate_object(obj_shovel1);
	shovel = true;
}

else
{
	shovel = false;
	instance_deactivate_object(obj_shovel1);
}





