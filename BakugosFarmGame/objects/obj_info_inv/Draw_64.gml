/// @description Insert description here
// You can write your code in this editor


if(can_draw)
{
	draw_self();
	draw_set_font(fnt_menu);
	draw_set_color(make_color_rgb(0,0,0));
	
	draw_text(x+12,y+4,resource_name);
	draw_text(x+12,y+20,resource_description);
}

