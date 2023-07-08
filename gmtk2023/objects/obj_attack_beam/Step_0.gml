


move_path(path);


image_angle = point_direction(xprev,yprev,x,y);

moveable_endstep();

if !object_in_room() {
	instance_destroy();
}


pt_emit(x,y,global.part_dust_beam,2, .5,1.2);

