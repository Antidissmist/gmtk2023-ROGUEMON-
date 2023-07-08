

draw_sort_y();

hsp = hpress*walkspeed;
vsp = vpress*walkspeed;


movecollide();

if x!=xprev || y!=yprev {
	aim();
}


if !global.button_hovered && mouse_l_pr {
	aimx = mouse_x;
	aimy = mouse_y;
	aim();
}


moveable_endstep();