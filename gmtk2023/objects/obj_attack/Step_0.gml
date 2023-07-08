


if nocollide>0 {
	move_nocollide();
}
else {
	movecollidebounce(place_solid_instage);
}

moveable_endstep();

if !object_in_room() {
	instance_destroy();
}


pt_emit(x,y,global.part_dust_yellow,2, 1,1.2);

