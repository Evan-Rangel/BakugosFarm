/// @description Insert description here
// You can write your code in this editor

if(global.can_show_inventory)
{
hide_inventory();
holders[index].sprite_index=spr_tool_holder_select;
}
else{
show_inventory();
holders[index].sprite_index=spr_tool_holder_normal;
}
