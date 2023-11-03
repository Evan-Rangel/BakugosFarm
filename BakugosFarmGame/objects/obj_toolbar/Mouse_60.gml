/// @description Movimiento en la toolbar

holders[index].sprite_index=spr_tool_holder_normal;

if(index<array_length(holders)-1)
{
	index++;
}
else
{
	index=0;
}
holders[index].sprite_index=spr_tool_holder_select;

