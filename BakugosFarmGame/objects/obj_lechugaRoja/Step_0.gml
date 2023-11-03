/// @description Estado de cultivo

if estado == "plantado" && global.time >= tiempo_necesario_para_crecer
{
    estado = "creciendo"; // Cambia el estado del cultivo a "cosechable"
    sprite_index = spr_lechugaRoja2; // Cambia el sprite del cultivo
}

else if estado == "creciendo" && global.time >= tiempo_necesario_para_crecer * 2
{
    estado = "cosechable"; // Cambia el estado del cultivo a "cosechable"
    sprite_index = spr_lechugaRoja3; // Cambia el sprite del cultivo
}


switch (estado)
{
    case "plantado":
        sprite_index = spr_lechugaRoja1;
        break;
    case "creciendo":
        sprite_index = spr_lechugaRoja2;
        break;
    case "cosechable":
        sprite_index = spr_lechugaRoja3;
        break;
}
