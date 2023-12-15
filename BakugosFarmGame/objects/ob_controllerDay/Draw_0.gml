/// @description Inserte aquí la descripción
// Puede escribir su código en este editor



// Evento Draw del objeto ob_controllerDay

// Calcular el factor de mezcla para el tono de color
blendFactor = currentCycleTime / dayCycleDuration;

// Interpolar entre los colores de día y noche
currentColor = merge_color(dayColor, nightColor, blendFactor);

// Configurar el tono de color con transparencia
alpha = 1 - blendFactor; // Invertir la transparencia para que sea más oscuro durante la noche
draw_set_alpha(alpha);

// Aplicar el tono de color a los sprites y el fondo
draw_set_color(currentColor);
draw_clear_alpha(c_white, 0); // Limpiar con el color actual

// Restaurar la transparencia a su valor original
draw_set_alpha(1);

// Dibuja tus sprites u otros elementos aquí
// Por ejemplo:

