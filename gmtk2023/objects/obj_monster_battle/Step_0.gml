

draw_sort_y();

/*
var canwalk = GAMETURN==1// || (GAMETURN==0 && obj_program.waiting);
with obj_movenow {
	image_index = !canwalk;
}
if canwalk {
	hsp = hpress*walkspeed;
	vsp = vpress*walkspeed;
}
else {
	hsp = 0;
	vsp = 0;
}*/

if PRESSABLE {
	hsp = hpress*walkspeed;
	vsp = vpress*walkspeed;
}



movecollide();


if x!=xprev || y!=yprev {
	side_aim();
}

//aimlock = GAMETURN==1 || !PLAYABLE;
if GAMETURN==0 && PLAYABLE {
	
	if !global.button_hovered && mouse_l {
		aimx = mouse_x;
		aimy = mouse_y;
		actor_aim();
	}
}

moveable_endstep();