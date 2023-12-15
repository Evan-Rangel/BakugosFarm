// Evento Create del objeto ob_controllerDay

currentCycleTime = 0;            // Tiempo actual en el ciclo (inicialmente día)
dayCycleDuration = 600;           // Duración del ciclo en frames (ajusta según sea necesario)
dayColor = make_color_rgb(255, 255, 255);  // Color normal para el día (blanco)
nightColor = make_color_rgb(30, 30, 50);   // Color azul oscuro para la noche
currentColor = dayColor;          // Establecer un valor predeterminado para currentColor
