/// @description Movimiento en la toolbar


holders[index].sprite_index=spr_tool_holder_normal;
if(index>0)
{
	index--;
}
else
{
	index=array_length(holders)-1;
}
holders[index].sprite_index=spr_tool_holder_select;
