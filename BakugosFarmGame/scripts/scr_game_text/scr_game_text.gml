/// @param text_id
function scr_game_text(_text_id) //Esta funcion tomara el nombre id del objeto para saber que texto mostrar. Aqui se guardaran todos los textos del juego.
{
	
	switch(_text_id) //Este switch decidira cual texto mostrar dependiendo con que personaje se esta hablando.
	{
		case "Evan":
			scr_text("Hola wee, soy Evan, solo queria recordarte que estas pendejo jijijijijij");
			scr_text("sos la hostia.");
			scr_text("tu codigo esta de la verga :v");		
		break;
		
		case "Gefe":
			scr_text("Quiero pepsi....");
			scr_text("o pegarle a mi mama");
			scr_text("ELDEN RING MI HERMANOOO");
		break;
		
		case "Arturo":
			scr_text("Perdon profe...me quede dormido.");
			scr_text("aih aih aih");
			scr_text("ESE WEEEEEEHHH..");
		break;
	}

}