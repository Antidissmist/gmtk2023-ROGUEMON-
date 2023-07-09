

draw_sort_y();
mask_index = sp_froglizard;

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
	
	if (hpress!=0 || vpress!=0) {
		if sprite_index != sp_froglizard_run {
			image_index = 0;
		}
		sprite_index = sp_froglizard_run;
	}
	else if sprite_index==sp_froglizard_run {
		sprite_index = sp_froglizard;
	}
	var hpt = PLAYABLE;
	with obj_enemy_battle {
		if myhealth<=0 {
			hpt = false;
		}
	}
	if collision_circle(bbox_midx,bbox_bottom,QUICKATTACKRANGE,obj_enemy_battle,true,false)!=noone && hpt {
		quickattacktimer++
		if quickattacktimer>QUICKATTACKTIME {
			textbox_battle("use Quick Strike!", 1,60);
			screenshake(5);
			with obj_enemy_battle {
				ysc = .2;
				var fx = fxobj_create(x,y,sp_quickattack,-200,2)
				fx.image_angle = point_direction(x,y,other.x,other.y)+180;
			}
			hittable_hit(id,1);
			quickattacktimer = -25;
		}
	}
	else {
		quickattacktimer = 0;
	}
}
else {
	quickattacktimer = 0
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

var s = -sign(xprev-x);
xsc = s==0 ? xsc : s;

moveable_endstep();