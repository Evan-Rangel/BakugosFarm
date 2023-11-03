/// @description Insert description here

/*-------Desactivar otras herramientas-----*/

//Pala
	shovel = false;
	instance_deactivate_object(obj_shovel1);
	
//Asada
	hoe = false;
	instance_deactivate_object(obj_hoe1);
	
//Regadera
	watercan = false;
	instance_deactivate_object(obj_watercan1);
	
/*------------------------------------------------------------------------------*/

if (!sword)
{
	instance_activate_object(obj_sword1);
	sword = true;

}

else
{
	sword = false;
	instance_deactivate_object(obj_sword1);
}


