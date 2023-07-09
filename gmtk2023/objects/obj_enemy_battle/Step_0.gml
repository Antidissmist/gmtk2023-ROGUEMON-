

draw_sort_y();


//movecollide();


if state==0 {
	
	
	var bw = bbox_width/2;
	var bh = bbox_height/2;
	with obj_battleboxregion {
		other.targx = random_range(bbox_left+bw,bbox_right-bw);
		other.targy = random_range(bbox_top+bh,bbox_bottom-bh);
	}
	state = 1;
	checktimer = 0;
}
else if PRESSABLE {
	
	var res = mp_potential_step_object(targx,targy,.75,obj_solid);
	checktimer++
	if checktimer>90 || res {
		state = 0;
	}
	
}

if interval(4) {
	var s = sign(xprev-x);
	xsc = s==0 ? xsc : s;
}

if (x!=xprev || y!=yprev) {//&& GAMETURN==1 {
	side_aim();
}


moveable_endstep();