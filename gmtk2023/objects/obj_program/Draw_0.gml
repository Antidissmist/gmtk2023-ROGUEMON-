
if room==rm_battle {
	var anymoving = PLAYABLE;



	if !obj_program.waiting {
	
		if (turntimer>120)
		|| (turntimer>60 && ((current_frame/30) % 2) < .5)
		|| (turntimer>30 && ((current_frame/10) % 2) < .5) {
			drawlines();
		}
	
	}

	with obj_enemy_battle {
		if anymoving && obj_monster_battle.quickattacktimer>=0 {
			dc(#ff004d);
			da(.25);
			draw_circle(x,y,QUICKATTACKRANGE,false);
			da(1);
			draw_circle(x,y,QUICKATTACKRANGE,true);
			dc(c_white);
		}
		draw_shadow(anymoving && GAMETURN==1);
	}
	
	if !instance_exists(obj_scene_throw) {
		with obj_monster_battle {
			draw_shadow(anymoving && GAMETURN==0);
		}
	}
	with obj_leader_battle {
		draw_shadow(anymoving && GAMETURN==0);
	}

}


