/// @description Insert description here
// You can write your code in this editor


draw_self();
draw_set_font(fnt_toolbar);
if(is_in_toolbar)
{
	draw_text_color(x-30,y-30,string(idx),0,0,0,0,1);
}
if(resource_count>0 && resource_obj!=noone)
{
	draw_text_color(x+20,y+20,string(resource_count),0,0,0,0,1);
	draw_sprite(resource_obj.sprite_index,0, x-36,y-32);
}
