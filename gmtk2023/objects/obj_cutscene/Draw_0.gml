
if sprite_exists(global.cutscenesprite) {
	draw_sprite(global.cutscenesprite,0,0,0);
}


timer++
if timer==90 {
	instance_activate_object(obj_pressanycontinue)
}

