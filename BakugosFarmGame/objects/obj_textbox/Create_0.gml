//Default Settings//
depth = -9999;
accept_key = noone;//Esto Yo agrege por si falla//
textbox_x = noone;//Esto Yo agrege por si falla//
textbox_y = noone;//Esto Yo agrege por si falla//

//Textbox Parameters//
textbox_width = 200; //Anchura de la caja de texto.
textbox_height = 64; //Altura de la caja de texto.
border = 8; //Borde de la caja del texto osea el espacio que habra para centrar el texto.
line_sep = 12; //Es el espacio entre cada renglon de texto.
line_width = textbox_width - border*2; //Con esto defino el maximo espacio que existira antes de romper el texto y ir al siguiente renglon.
textbox_img = 0; //La imagen del textbox.
textbox_speed = 6/60; //La velocidad de la animacion del textbox, depende de los frames a los que va el juego que espero sea 60 alv, osea se divide el numero de frames de la animacion entre el numero de fos del juego.


//Text Parameters//
page = 0; //Esta variable nos ayudara a saber en que pagina del dialogo estamos.
page_number = 0;
text[0] = ""; //Un arreglo de texto para guardar todas las palabras que estaran en la paguina.
text_lenght[0] = string_length(text[0]); //Guardamos las palabras en un medidor de texto para usarlo, tambien con esto nos aseguramos que no se escriban palabras que no exiten.
char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;
draw_char = 0; //Este determinara cual letra es la que se esta escribiendo.
text_speed = 1; //Determinara la velocidad en que aparecen las letras.


//Options Parameters//
option[0] = ""; //Guardara las opciones que hay para contestas.
option_link_id[0] = -1; //Esta permitira saber quien esta dando las opciones.
option_pos = 0; //Con esto se sabra que decision se selecciono si necesidad del mouse si no con teclas (por ahora oslo teclas).
option_number = 0; //Esta variable me permite poner limite para que no se salga y quiera seleccionar una opcion vacia o que no existe.


//Sound Parameters//
snd_delay = 4;
snd_count = snd_delay;


//Effects Parameters//
scr_set_defautlts_for_text(); //La funcion que cree para romper el texto.
last_free_space = 0; //Para poder saberdonde termina la palabra y hacer espacios.
text_pause_timer = 0;
text_pause_time = 16;


setup = false; //Esta variable determinara si ya se termino el dialogo o no.