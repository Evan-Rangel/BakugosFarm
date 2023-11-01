/// @param
function scr_set_defautlts_for_text() //Esta funcion hace mejor los breaks entre palabras para que no supere el tamnio de la textbox
{
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	textbox_spr[page_number] = spr_textbox; //Esta variable es igual a mi sprite de textbox.
	speaker_sprite[page_number] = noone; 
	speaker_side[page_number] = 1;
}


/// @param text
/// @param [Character]
function scr_text(_text) //Esta funcion facilita crear textos, acomoda los textos en el orden que se escriben, y es facil de llamar en cualquier objeto.
{
	scr_set_defautlts_for_text();

	text[page_number] = _text;
	
	//Get character Information
	if (argument_count > 1)
	{
		switch(argument[1])
		{
			//---Gefeyafa (Protagonista)---//
			case "Gefeyafa-Normal":
			speaker_sprite[page_number] = spr_gefeyafa_normal_ads;
			textbox_spr[page_number] = spr_textbox_red;
			break;
			case "Gefeyafa-Enojado":
			speaker_sprite[page_number] = spr_gefeyafa_enojado_ads;
			textbox_spr[page_number] = spr_textbox_red;
			break;
			case "Gefeyafa-Incomodo":
			speaker_sprite[page_number] = spr_gefeyafa_incomodo_ads;
			textbox_spr[page_number] = spr_textbox_red;
			break;
			//-----------------------------//
			
			//---Campesina ----------------//
			case "Campesina-Normal":
			speaker_sprite[page_number] = spr_gefeyafa_normal_ads;
			textbox_spr[page_number] = spr_textbox_red;
			break;
			case "Campesina-Enojado":
			speaker_sprite[page_number] = spr_gefeyafa_normal_ads;
			textbox_spr[page_number] = spr_textbox_red;
			break;
			case "Campesina-Incomodo":
			speaker_sprite[page_number] = spr_gefeyafa_normal_ads;
			textbox_spr[page_number] = spr_textbox_red;
			break;
			//-----------------------------//
		}
	}
	
	page_number++;
}


/// @param option
/// @param link_id
function scr_option(_option, _link_id) //Esta funcion sera la encargada de proporcional las opciones y mostrar dialogos dependiendo de ellas.
{
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}


/// @param text_id
function create_textbox(_text_id) //Esta funcion facilita el crear las textboxs
{
	with (instance_create_depth(0, 0, -9999, obj_textbox)) //Si se da click al objeto se creara una instancia del obj_textbox, y gracias al "with" le puedo agregar a mi script que me permite poner el texto adecuado.
	{
		scr_game_text(_text_id); //A la funcion qu ecree le paso el id y el nombre del objeto clickeado.
	}	
}