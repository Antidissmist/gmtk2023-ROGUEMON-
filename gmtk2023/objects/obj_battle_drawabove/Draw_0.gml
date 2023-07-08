

with obj_monster_battle {
	if aimx!=undefined && aimy!=undefined {
		var sc = .5;
		var a = current_time/16;
		draw_sprite_ext(sp_aimcircle,0,aimx,aimy, sc,sc, a,c_white,.6);
	}
}

