/// @description Inserte aquí la descripción
// Puede escribir su código en este editor


// Incrementa el ciclo día/noche
global.dayNightCycle += 1;

// Ajusta la velocidad del ciclo según tus necesidades
// Puedes cambiar el valor de 1 a otro número para acelerar o ralentizar el ciclo.

// Calcula el tono de color en base al ciclo día/noche
var colorTone = make_color_hsv(global.dayNightCycle, 1, 1);

// Aplica el tono de color a todos los sprites en pantalla
draw_set_color(global.dayNightColor);
draw_set_alpha(0.5); // Puedes ajustar la opacidad según tus preferencias
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
draw_set_alpha(1);

// Restaura el color a blanco para evitar que afecte a otros objetos o interfaces
draw_set_color(c_white);


