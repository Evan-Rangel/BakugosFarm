accept_key = keyboard_check_pressed(vk_space);

textbox_x = camera_get_view_x(view_camera[0]); //Aqui se le indica en donde se va a crear el textbox en la coordenada x, esto lo acomoda en el centro de la camara 0, la suma es el offset.
textbox_y = camera_get_view_y(view_camera[0]) + 144; //Aqui se le indica en donde se va a crear el textbox en la coordenada y, esto lo acomoda en el centro de la camara 0, la suma es el offset.


//-------SetUp-------//
if (setup == false) //Se hace un chequeo para saber si existe un dialogo a mostrar.
{
	setup = true; //Lo hacemos falso luego luego por que quiero que esto ocurra cada frame, ya que se escribira por pagina.
	draw_set_font(global.font_main); //Se usa la font que cree.
	draw_set_valign(fa_top); //Alineo el texto hacia arriba.
	draw_set_halign(fa_left); //Alineo el texto a la izquierda.
	
	//Loop through the pages
	for (var _p = 0; _p < page_number; _p++)
	{
		//Identifica cuantos characteres estan en cada pagina y guarda ese numero en el arreglo de "text_lenght".
		text_lenght[_p] = string_length(text[_p]); //Esto se pone igual que en el create solo es para darle el vallo "_p".
		
		//Character talking on the left
		text_x_offset [_p] = 80;
		portrait_x_offset[_p] = 8;
		
		//Character talking on the right
		if (speaker_side[_p] == -1)
		{
			text_x_offset[_p] = 8;
			portrait_x_offset[_p] = 216;
		}
		
		//No Character talking ( center the textbox).
		if (speaker_sprite[_p] == noone)
		{
			text_x_offset[_p] = 44; // Obtiene la posicion en x del textbox para hacer el offset.
		}
		
		//Settings individual characters and finding where the lines of text should break
		for (var _c = 0; _c < text_lenght[_p]; _c++)
		{
			var _char_pos = _c + 1;
			
			//Store individual character in the "char" array
			char[_c, _p] = string_char_at(text[_p], _char_pos);
			
			//Get current width of the line
			var _txt_up_to_char = string_copy(text[_p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[_c, _p]);
			
			//Get the last free space
			if (char[_c, _p] == " ")
			{
				last_free_space = _char_pos + 1;
			}
			
			//Get the line breaks
			if (_current_txt_w - line_break_offset[_p] > line_width)
			{
				line_break_pos[line_break_num[_p], _p] = last_free_space;
				line_break_num[_p]++;
				var _txt_up_to_last_space = string_copy(text[_p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[_p], last_free_space);
				line_break_offset[_p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
			}
		}
		
		//Getting each characters coordinates
		for (var _c = 0; _c < text_lenght[_p]; _c++)
		{
			var _char_pos = _c + 1;
			var _txt_x = textbox_x + text_x_offset[_p] + border;
			var _txt_y = textbox_y + border;
			
			//Get current width of the line
			var _txt_up_to_char = string_copy(text[_p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[_c, _p]);
			var _txt_line = 0;
			
			//Compensate for string breaks
			for (var _lb = 0; _lb < line_break_num[_p]; _lb++)
			{
				//If the current looping character is after a line break
				if (_char_pos >= line_break_pos[_lb, _p])
				{
					var _str_copy = string_copy(text[_p], line_break_pos[_lb, _p], _char_pos - line_break_pos[_lb, _p]);
					_current_txt_w = string_width(_str_copy);
					
					//Record the "line" this character should be on
					_txt_line = _lb + 1; //+1 ya que _lb empieza en 0
				}
			}
			//Add to the X and Y coordinates base on the new info
			char_x[_c, _p] = _txt_x + _current_txt_w;
			char_y[_c, _p] = _txt_y + _txt_line*line_sep;
		}
	}
}


//-------Typing the text-------//
if (text_pause_timer <= 0)
{
	if (draw_char < text_lenght[page]) //Si hay letras a escribir empezaran a dibujarse una por una.
	{
		draw_char += text_speed; //Se agrega la velocidad del texto hast aque se llene el tamanio.
		draw_char = clamp(draw_char, 0, text_lenght[page]); //Lo clampeo para sin importad la velocidad no de errores, esto lo que hace es darle un minimo y maximo de letras a escribir por frame, dependiendo de la cantidad que existen.
		var _check_char = string_char_at(text[page], draw_char);
		if (_check_char == "." || _check_char == "?" ||  _check_char == ",")
		{
			text_pause_timer = text_pause_time;
			if (!audio_is_playing(snd[page]))
			{
				audio_play_sound(snd[page], 8, false);	
			}			
		}
		else
		{
			//Typing Sound
			if (snd_count < snd_delay)
			{
				snd_count++;
			}
			else 
			{
				snd_count = 0;
				//audio_sound_pitch(snd[page], random_range(0.8, 1.2));
				audio_play_sound(snd[page], 8, false);				
			}
		}
	}
}
else
{
	text_pause_timer--;	
}


//-------Flip through pages-------//
if (accept_key) //Si se preciona espacio cambiara de pagina de texto, si el texto continua lo acabara por completo.
{
	//Si el texto termino de escribirse
	if ( draw_char == text_lenght[page])
	{
		//Cambio de pagina
		if (page < page_number - 1) 
		{
			page++;
			draw_char = 0;
		}	
		//Eliminar la textbox
		else
		{
			//Link text for options
			if (option_number > 0)
			{
				create_textbox(option_link_id[option_pos]);
			}
			instance_destroy();
		}
	}	
	//Si no a terminado el texto de escribirse
	else
	{
		draw_char = text_lenght[page]; //Llena el cuadro con todo el texto existente.		
	}
}


//-------Draw the textbox-------//
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
textbox_img += textbox_speed;
textbox_spr_w = sprite_get_width(textbox_spr[page]);
textbox_spr_h = sprite_get_height(textbox_spr[page]);
//Draw the speaker
if (speaker_sprite[page] != noone)
{
	sprite_index = speaker_sprite[page];
	if (draw_char == text_lenght[page])
	{
		image_index = 0;
	}
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if (speaker_side[page] == -1) 
	{
		_speaker_x += sprite_width;	
	}
	//Draw the speaker
	draw_sprite_ext(textbox_spr[page], textbox_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/textbox_spr_w, sprite_height/textbox_spr_h, 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1);
}


//Back of the text box
draw_sprite_ext(textbox_spr[page], textbox_img, _txtb_x, _txtb_y, textbox_width/textbox_spr_w, textbox_height/textbox_spr_h, 0, c_white, 1);


//-------Options-------//
if (draw_char == text_lenght[page] && page == page_number - 1)
{
	//Option selection
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number - 1);
	
	//Draw th options
	var _op_space = 15; //Espacio entre los cuadros de opciones hacia abajo
	var _op_bord = 4; //Esta es un borde para que exista un espacio entre las letras y el textbox de la opcion
	for (var _op = 0; _op < option_number; _op++)
	{
		//The option box
		var _o_w = string_width(option[_op]) + _op_bord*2;
		draw_sprite_ext(textbox_spr[page],  textbox_img, _txtb_x + 16, _txtb_y - _op_space*option_number + _op_space*_op, _o_w/textbox_spr_w, (_op_space-1)/textbox_spr_h, 0, c_white, 1);
		
		//The arrow
		if (option_pos == _op)
		{
			draw_sprite(spr_option_arrow, 0, _txtb_x, _txtb_y - _op_space*option_number + _op_space*_op);
		}
		
		//The option text
		draw_text(_txtb_x + 16 + _op_bord, _txtb_y - _op_space*option_number + _op_space*_op + 2, option[_op]);
	}
}


//-------Draw the text-------//
//var _drawtext = string_copy(text[page], 1, round(draw_char));  //OPTIMIZADO
//var _drawtext = string_copy(text[page], 1, draw_char);  //OPTIMIZADO
//draw_text_ext(_txtb_x + border, _txtb_y + border, _drawtext, line_sep, line_width);  //OPTIMIZADO
for (var _c = 0; _c < draw_char; _c++)
{
	//Floating Text
	var _float_y = 0;
	if (float_text[_c, page] == true)
	{
		float_dir[_c, page] += -6; //Es  la velocidad a la que las letras flotan
		_float_y = dsin(float_dir[_c, page])*2; //Es que tanto vana avanzar las letras (recomendado dejarlo en 1 o 2).
	}
	
	//Shake Text
	var _shake_x = 0;
	var _shake_y = 0;
	if (shake_text[_c, page] == true)
	{
		shake_timer[_c, page]--;
		if (shake_timer[_c, page] <= 0)
		{
			shake_timer[_c, page] = irandom_range(4, 8);
			shake_dir[_c, page] = irandom(360);
		}		
		if(shake_timer[_c, page] <= 2)
		{
			_shake_x = lengthdir_x(1, shake_dir[_c, page]);
			_shake_y = lengthdir_y(1, shake_dir[_c, page]);
		}		
	}
		
	//The text
	draw_text_color(char_x[_c, page] + _shake_x, char_y[_c, page] + _float_y + _shake_y, char[_c, page], col_1[_c, page], col_2[_c, page], col_3[_c, page], col_4[_c, page], 1);
}