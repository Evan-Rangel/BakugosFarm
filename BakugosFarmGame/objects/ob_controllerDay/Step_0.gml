/// @description Inserte aquí la descripción
// Puede escribir su código en este editor


// Evento Step del objeto ob_controllerDay

currentCycleTime += 1;

// Verificar si ha pasado un ciclo completo y reiniciar el contador
if (currentCycleTime > dayCycleDuration) {
    currentCycleTime = 0;
}

// Calcular el factor de mezcla para el tono de color
blendFactor = currentCycleTime / dayCycleDuration;

// Interpolar entre los colores de día y noche
currentColor = merge_color(dayColor, nightColor, blendFactor);