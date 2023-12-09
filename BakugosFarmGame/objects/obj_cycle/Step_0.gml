// Evento Step del objeto controlador
if (global.dia) {
    // Es de día
    capa_dia_noche.colour = c_white; // Color blanco para el día
    capa_dia_noche.alpha = 1; // Sin tono para el día
} else {
    // Es de noche
    capa_dia_noche.colour = c_black; // Color negro para la noche (puedes ajustar según tu preferencia)
    capa_dia_noche.alpha = 0.5; // Puedes ajustar el tono para la noche
}