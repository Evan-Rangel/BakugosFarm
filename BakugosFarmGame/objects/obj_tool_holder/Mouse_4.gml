/// @description Insert description here

if(global.resource_can_move)
{
	resource_stop_move_position();
}
else
if(resource_obj!=noone)
{
	resource_start_move_position(resource_obj, resource_count);
}