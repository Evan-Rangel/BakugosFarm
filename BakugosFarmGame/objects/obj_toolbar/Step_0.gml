/// @description Insert description here
// You can write your code in this editor
if(!global.can_show_inventory)
{
holders[index].sprite_index=spr_tool_holder_normal;
switch(keyboard_key)
{
	case ord("1"):
		index=0;
	break;
	case ord("2"):
		index=1;
	break;
	case ord("3"):
		index=2;
	break;
	case ord("4"):
		index=3;
	break;
	case ord("5"):
		index=4;
	break;
	case ord("6"):
		index=5;
	break;
	case ord("7"):
		index=6;
	break;
	case ord("8"):
		index=7;
	break;
	case ord("9"):
		index=8;
	break;
}

holders[index].sprite_index=spr_tool_holder_select;

}


