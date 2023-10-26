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
		
		//No Character talking ( center the textbox).
		text_x_offset[_p] = 44; // Obtiene la posicion en x del textbox para hacer el offset.
		
	}
}


//-------Typing the text-------//
if (draw_char < text_lenght[page]) //Si hay letras a escribir empezaran a dibujarse una por una.
{
	draw_char += text_speed; //Se agrega la velocidad del texto hast aque se llene el tamanio.
	draw_char = clamp(draw_char, 0, text_lenght[page]); //Lo clampeo para sin importad la velocidad no de errores, esto lo que hace es darle un minimo y maximo de letras a escribir por frame, dependiendo de la cantidad que existen.
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
textbox_spr_w = sprite_get_width(textbox_spr);
textbox_spr_h = sprite_get_height(textbox_spr);
//Back of the text box
draw_sprite_ext(textbox_spr, textbox_img, _txtb_x, _txtb_y, textbox_width/textbox_spr_w, textbox_height/textbox_spr_h, 0, c_white, 1);


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
		draw_sprite_ext(textbox_spr,  textbox_img, _txtb_x + 16, _txtb_y - _op_space*option_number + _op_space*_op, _o_w/textbox_spr_w, (_op_space-1)/textbox_spr_h, 0, c_white, 1);
		
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
var _drawtext = string_copy(text[page], 1, round(draw_char));
//var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(_txtb_x + border, _txtb_y + border, _drawtext, line_sep, line_width);