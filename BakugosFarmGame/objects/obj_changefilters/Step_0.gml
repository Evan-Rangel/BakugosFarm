/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// En el evento Step del objeto o en algún controlador de tiempo
global.Hue += global.DayCycleSpeed;

if (global.Hue >= 360) {
    global.Hue = 0;
}

// Establecer el color a un tono basado en el ciclo día/noche
var setColor = make_color_hsv(global.Hue, 100, 50);

// Configurar el color del fondo
background_set_color(setColor);

