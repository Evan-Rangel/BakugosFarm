/// @param text_id
function scr_game_text(_text_id) //Esta funcion tomara el nombre id del objeto para saber que texto mostrar. Aqui se guardaran todos los textos del juego.
{
	
	switch(_text_id) //Este switch decidira cual texto mostrar dependiendo con que personaje se esta hablando.
	{
		//---Evan---// //---id: 1---//
		case "Evan":
			scr_text("Hola wee, soy Evan, solo queria recordarte que estas pendejo jijijijijij");
				scr_text_float(14, 17);
				//scr_text_shake(14, 17);
				scr_text_color(14, 17, c_red,  c_red,  c_red,  c_red); 
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
		
		//---Gefe---// //---id: 2---//
		case "Gefeyafa":
			scr_text("...", "Gefeyafa-Normal");
			scr_text("Quiero pepsi....", "Gefeyafa-Normal");
			scr_text("Hola humano...");
			scr_text("Quiero tanto una Pepsi que ya escucho chingaderas.", "Gefeyafa-Incomodo");
			scr_text("No estas escuchando nada humano, soy real, solo no tengo un cuerpo fisico.");
			scr_text("Si eres dios largate de aqui cabron, me tienes hasta la verga con la suerte que me das.", "Gefeyafa-Enojado");
			scr_text("ok :(.");
		break;
		//----------//
		
		//---Campesina---// //---id: 3---//
		case "Campesina":
			scr_text("HOLAAAAA!!!, eres nuevo por aqui?", "Campesina-Normal", -1);
			scr_text("Ayy no una morra bien ruidosa.", "ProneBodoque-Normal");
			scr_text("No te entendi como te llamas?!!", "Campesina-Normal", -1);
			scr_text("...Bodoque...", "ProneBodoque-Normal");
				scr_text_color(3, 10, c_red,  c_red,  c_red,  c_red); 
			scr_text("Que..nombre tan raro pero esta bien. Mucho gusto me llam...", "Campesina-Normal", -1);
			scr_text("Si si, oye campesina sabes donde esta la residencia Prones?", "ProneBodoque-Normal");
			scr_text("Lucy...Me llamo Lucy.", "Campesina-Incomoda", -1);
				scr_text_shake(0, 3);  scr_text_shake(16, 20);
				scr_text_color(0, 3, c_olive,  c_olive,  c_olive,  c_olive);  scr_text_color(16, 19, c_olive,  c_olive,  c_olive,  c_olive); 
			scr_text("Pero si, si se donde esta la residencia Prones, esta despues del lago, sigueme.", "Campesina-Normal", -1);
			scr_text("Que hueva, caminar mas, pero va, te sigo.", "ProneBodoque-Normal");
			scr_text("(Sigues a la morra castrosa)");
		//----------//
	}

}