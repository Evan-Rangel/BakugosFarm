//Textbox Parameters
textbox_width = 200; //Anchura de la caja de texto.
textbox_height = 64; //Altura de la caja de texto.
border = 8; //Borde de la caja del texto osea el espacio que habra para centrar el texto.
line_sep = 12; //Es el espacio entre cada renglon de texto.
line_width = textbox_width - border*2; //Con esto defino el maximo espacio que existira antes de romper el texto y ir al siguiente renglon.
textbox_spr = spr_textbox; //Esta variable es igual a mi sprite de textbox.
textbox_img = 0; //La imagen del textbox.
textbox_speed = 6/60; //La velocidad de la animacion del textbox, depende de los frames a los que va el juego que espero sea 60 alv, osea se divide el numero de frames de la animacion entre el numero de fos del juego.

//Text Parameters
page = 0; //Esta variable nos ayudara a saber en que pagina del dialogo estamos.
page_number = 0;
text[0] = ""; //Un arreglo de texto para guardar todas las palabras que estaran en la paguina.
text_lenght[0] = string_length(text[0]); //Guardamos las palabras en un medidor de texto para usarlo, tambien con esto nos aseguramos que no se escriban palabras que no exiten.
draw_char = 0; //Este determinara cual letra es la que se esta escribiendo.
text_speed = 1; //Determinara la velocidad en que aparecen las letras.

setup = false; //Esta variable determinara si ya se termino el dialogo o no.