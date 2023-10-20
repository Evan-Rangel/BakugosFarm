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
	page_number = array_length(text); //Esto es para saber cuantas veces se va a hacer el loop dependiendo de la cantidad de texto que queda.
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
textbox_img += textbox_speed;
textbox_spr_w = sprite_get_width(textbox_spr);
textbox_spr_h = sprite_get_height(textbox_spr);
//Back of the text box
draw_sprite_ext(textbox_spr, textbox_img, textbox_x + text_x_offset[page], textbox_y, textbox_width/textbox_spr_w, textbox_height/textbox_spr_h, 0, c_white, 1);


//-------Draw the text-------//
//var _drawtext = string_copy(text[page], 1, round(draw_char));
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);