/// @description Darle valor a los holders
// You can write your code in this editor

for( index=0;index<9;index++)
{
	 holders[index]=instance_find(obj_tool_holder,index);
}

for(index=0 ; index< array_length(holders); index++)
{
	holders[index].sprite_index=spr_tool_holder_normal;
	holders[index].idx=index+1;
	holders[index].is_in_toolbar=true;
}
holders[0].sprite_index=spr_tool_holder_select;
index=0;
get_inventory_holders();
