

with obj_monster_battle {
	if GAMETURN==0 && aimx!=undefined && aimy!=undefined {
		var sc = .5;
		var a = current_time/16;
		draw_sprite_ext(sp_aimcircle,0,aimx,aimy, sc,sc, a,c_white,.7);
		
		draw_sprite_ext(sp_aimcircle,0,mouse_x,mouse_y, sc,sc, a,c_white,.25);
		
		if aimlock {
			draw_sprite_ext(sp_aimlock,0,aimx-25,aimy,.75,.75,0,c_white,.7)
		}
		
	}
}
with obj_enemy_battle {
	if GAMETURN==1 && aimx!=undefined && aimy!=undefined {
		var sc = .5;
		var a = current_time/16;
		draw_sprite_ext(sp_aimcircle,0,aimx,aimy, sc,sc, a,c_white,.7);
	}
}

with obj_program {
	part_system_drawit(ps_top);
	
	if GAMETURN==1 {
		dtext(vw-130,15,"turn time: "+framestotime(turntimer),1);
	}
	
	
	var i=1;
	var isc = 1;
	var spc = 16;
	var ix = 10;
	var iy = vh-8;
	
	if ATTACK_BOUNCES {
		dtext(ix,iy-i++*spc, "bounces", isc);
	}
	if ATTACK_PIERCES {
		dtext(ix,iy-i++*spc, "pierces", isc);
	}
	
}


with obj_hittable {
	var yoff = sprite_get_yoffset(sprite_index);
	draw_hpbar(bbox_midx,y-yoff-15,get_health(),get_maxhealth());
}



