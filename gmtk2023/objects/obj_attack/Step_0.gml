


move_path(path);
moveable_endstep();

if !object_in_room() {
	instance_destroy();
}


pt_emit(x,y,global.part_dust_yellow,2, 1,1.2);

