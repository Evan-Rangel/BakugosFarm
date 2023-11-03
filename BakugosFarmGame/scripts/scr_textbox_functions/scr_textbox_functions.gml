/// @param
function scr_set_defautlts_for_text() //Esta funcion hace mejor los breaks entre palabras para que no supere el tamnio de la textbox
{
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//Variables for every letter/character
	for (var _j = 0; _j < 500; _j++)
	{
		col_1[_j, page_number] = c_white;
		col_2[_j, page_number] = c_white;
		col_3[_j, page_number] = c_white;
		col_4[_j, page_number] = c_white;
	}
	
	textbox_spr[page_number] = spr_textbox; //Esta variable es igual a mi sprite de textbox.
	speaker_sprite[page_number] = noone; //Esta variable guarda el sprite que esta hablando, si no se le indica no lo mostrara por default.
	speaker_side[page_number] = 1; //Esta variable indica de que lado esta hablando el personaje, 1 es izquierda y -1 es derecha.
	snd[page_number] = snd_random; //Esta variable guarda el sonido que haran al hablar. "audio_sound_pitch(snd[page], random_range(0.8, 1.2));" esa funcion hace una variacion en el tono para que no sea la misma siempre.
}



/// @param 1st_char
/// @param last_char
/// @param col1
/// @param col2
/// @param col3
/// @param col4
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4) //Esta funcion sirve para cambiar el color del texto, se llama la funcion despues de la linea que se quiere modificar, le dices el inicio de la palabra y el final, luego el color de cada letra.
{
	for (var _c = _start; _c <= _end; _c++)
	{
		col_1[_c, page_number - 1] = _col1;
		col_2[_c, page_number - 1] = _col2;
		col_3[_c, page_number - 1] = _col3;
		col_4[_c, page_number - 1] = _col4;
		
		float_text[_c, page_number] = 0;
		float_dir[_c, page_number] = _c*20;
	}
}




/// @param 1st_char
/// @param last_char
function scr_text_float(_start, _end)
{
	for (var _c = _start; _c <= _end; _c++)
	{
		float_text[_c, page_number-1] = true;
	}
}



/// @param text
/// @param [Character]
/// @param [Side]
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
			snd[page_number] = snd_boytyping;
			break;
			case "Gefeyafa-Enojado":
			speaker_sprite[page_number] = spr_gefeyafa_enojado_ads;
			textbox_spr[page_number] = spr_textbox_red;
			snd[page_number] = snd_boytyping; 
			break;
			case "Gefeyafa-Incomodo":
			speaker_sprite[page_number] = spr_gefeyafa_incomodo_ads;
			textbox_spr[page_number] = spr_textbox_red;
			snd[page_number] = snd_boytyping;
			break;
			//-----------------------------//
			
			//---Campesina ----------------//
			case "Campesina-Normal":
			speaker_sprite[page_number] = spr_campesina_normal_ads;
			textbox_spr[page_number] = spr_textbox_brown;
			speaker_side[page_number] = -1;
			snd[page_number] = snd_girltyping;
			break;
			case "Campesina-Enojada":
			speaker_sprite[page_number] = spr_campesina_enojada_ads;
			textbox_spr[page_number] = spr_textbox_brown;
			speaker_side[page_number] = -1;
			snd[page_number] = snd_girltyping;
			break;
			case "Campesina-Incomoda":
			speaker_sprite[page_number] = spr_campesina_triste_ads;
			textbox_spr[page_number] = spr_textbox_brown;
			speaker_side[page_number] = -1;
			snd[page_number] = snd_girltyping;
			break;
			//-----------------------------//
		}
	}
	
	//Side the character is on
	if (argument_count > 2)
	{
		speaker_side[page_number] = argument[2];
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