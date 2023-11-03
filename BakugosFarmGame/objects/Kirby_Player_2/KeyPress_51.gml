/// @description Insert description here

/*-------Desactivar otras herramientas-----*/

//Espada
	sword = false;
	instance_deactivate_object(obj_sword1);
	
//Pala
	shovel = false;
	instance_deactivate_object(obj_shovel1);
	
//Regadera
	watercan = false;
	instance_deactivate_object(obj_watercan1);

/*------------------------------------------------------------------------------*/


if (!hoe)
{
	instance_activate_object(obj_hoe1);
	hoe = true;
}

else
{
	hoe = false;
	instance_deactivate_object(obj_hoe1);
}


