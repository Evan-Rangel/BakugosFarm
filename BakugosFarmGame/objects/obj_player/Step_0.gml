//Movement Keys Settings//
right_key = keyboard_check(vk_right); //Al pulsar la tecla de la derecha te moveras a esa direccion.
left_key = keyboard_check(vk_left); //Al pulsar la tecla de la izquierda te moveras a esa direccion.
up_key = keyboard_check(vk_up); //Al pulsar la tecla de la arriba te moveras a esa direccion.
down_key = keyboard_check(vk_down); //Al pulsar la tecla de la abajo te moveras a esa direccion.


//-------Movement SetUp-------//
xspd = (right_key - left_key) * move_spd; //Es una resta para identificar el movmiento, si se pulsa a la derecha entonces sera 1 - 0, asi que te moveras a la derecha, si se pulsa izquierda sera 0 - 1, el resultado sera -1 asi que te moveras a las izquierda. Se multiplica por la velocidad que tendra el personaje, se mueve por pixeles.
yspd = (down_key - up_key) * move_spd; //Misma logica que la xspd, solo que down_key va primero ya que en game maker el eje y esta alreves.

//Set Movement Sprite//
mask_index = sprite[DOWN];
if (yspd == 0) //Mantener el sprite sin importar que se pulse una tecla que se mueve en el eje y.
{
	if (xspd > 0) {face = RIGHT}; //Mostrar el sprite de la derecha al caminar en esa dirreccion.
	if (xspd < 0) {face = LEFT}; //Mostrar el sprite de la izquierda al caminar en esa dirreccion.
}
if (xspd > 0 && face == LEFT) {face = RIGHT};
if (xspd < 0 && face == RIGHT) {face = LEFT};
if (xspd == 0) //Mantener el sprite sin importar que se pulse una tecla que se mueve en el eje x.
{
	if (yspd < 0) {face = DOWN}; //Mostrar el sprite de la abajo al caminar en esa dirreccion.
	if (yspd > 0) {face = UP}; //Mostrar el sprite de la arriba al caminar en esa dirreccion.
}
if (yspd < 0 && face == UP) {face = DOWN};
if (yspd > 0 && face == DOWN) {face = UP};
sprite_index = sprite[face];

//Colisions//
if (place_meeting(x + xspd, y, obj_wall) == true || place_meeting(x + xspd, y, obj_wall_short_l) == true || place_meeting(x + xspd, y, obj_wall_short_r) == true) //Si el jugador colisiona con la "obj_wall" se dejara de mover en el eje x.
{
	xspd = 0;	
}
if (place_meeting(x, y + yspd, obj_wall) == true) //Si el jugador colisiona con la "obj_wall" se dejara de mover en el eje y.
{
	yspd = 0;	
}

//Move the Player//
x += xspd; //Aqui ya se le indica como funcionara el movimiento en X segun GameMaker.
y += yspd; //Aqui ya se le indica como funcionara el movimiento en y segun GameMaker.

//Animate//
if (xspd == 0 && yspd == 0)
{
	image_index = 0;
}


