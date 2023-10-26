/// @param text_id
function scr_game_text(_text_id) //Esta funcion tomara el nombre id del objeto para saber que texto mostrar. Aqui se guardaran todos los textos del juego.
{
	
	switch(_text_id) //Este switch decidira cual texto mostrar dependiendo con que personaje se esta hablando.
	{
		//---Evan---//
		case "Evan":
			scr_text("Hola wee, soy Evan, solo queria recordarte que estas pendejo jijijijijij");
			scr_text("sos la hostia.");
			scr_text("tu codigo esta de la verga :v");		
			scr_text("Quieres ayuda?");	
				scr_option("Si pofavoo", "Evan - si");
				scr_option("No sho puedo boludo", "Evan - no");
		break;
			case "Evan - si":
				scr_text("ven deja te explico joto");
			break;
			case "Evan - no":
				scr_text("va, pero arregla tu mamada");	
			break;
		//----------//
		
		//---Gefe---//
		case "Gefe":
			scr_text("Quiero pepsi....");
			scr_text("o pegarle a mi mama");
			scr_text("ELDEN RING MI HERMANOOO");
				scr_option("Deja lo comporo mi hermano", "Gefe - si");
				scr_option("Pero tenemos examenes", "Gefe - no");			
		break;
			case "Gefe - si":
				scr_text("Date prisa mi hermano ya mero acabo todos los logros");	
			break;
			case "Gefe - no":
				scr_text("AAAAAAGGGGGGGHHHHHHHHHHHHH");	
			break;
		//----------//
		
		//---Arturo---//
		case "Arturo":
			scr_text("Perdon profe...me quede dormido.");
			scr_text("aih aih aih");
			scr_text("ESE WEEEEEEHHH..");
				scr_option("Mario Wonder cabron", "Arturo - si");
				scr_option("Levantate temprano cabronnnnn", "Arturo - no");
		break;
			case "Arturo - si":
				scr_text("Pero deja que acabemos los exameness");	
			break;
			case "Arturo - no":
				scr_text("Se me callo una piedra en la cama weeh");	
			break;
		//----------//
	}

}