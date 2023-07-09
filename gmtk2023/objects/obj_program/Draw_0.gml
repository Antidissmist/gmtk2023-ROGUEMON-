

var anymoving = PLAYABLE;



if !obj_program.waiting {
	
	if (turntimer>120)
	|| (turntimer>60 && ((current_time/200 % 2) < .5))
	|| (turntimer>30 && ((current_time/60 % 2) < .5)) {
		drawlines();
	}
	
}

with obj_enemy_battle {
	draw_shadow(anymoving && GAMETURN==1);
}
with obj_monster_battle {
	draw_shadow(anymoving && GAMETURN==0);
}
with obj_leader_battle {
	draw_shadow(anymoving && GAMETURN==0);
}


