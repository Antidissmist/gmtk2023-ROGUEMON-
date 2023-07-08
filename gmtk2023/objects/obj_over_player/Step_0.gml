
hsp = hpress*walkspeed;
vsp = vpress*walkspeed;

if PLAYABLE {

	var tr = instance_place(x,y,obj_over_trainer);
	if tr!=noone {
		transition(rm_battle);
	}

}


movecollide();

camera_target(bbox_midx,bbox_midy);