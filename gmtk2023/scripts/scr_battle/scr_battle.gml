


function battle_enemy_dies() {
	
}
function battle_leader_dies() {
	
}
function battle_monster_dies() {
	if GAMETURN==0 {
		battle_endturn();
	}
}
function battle_endturn() {
	
	
	//player attack
	if ATTACK_TYPENAME!="" && ATTACK_TYPENAME!=-1 {
		if GAMETURN==0 {
			with obj_monster_battle {
				if ATTACK_TYPENAME!=ATTACK_TOLDNAME {
					approval_adjust("defymove");
					notice("defy","approval down",c_red);
				}
				actor_attack();
			}
		}
		else {
			with obj_enemy_battle {
				actor_attack();
			}
		}
	}
	
	GAMETURN = !GAMETURN;
	with obj_program {
		waiting = true;
		waitcheck = waitchecktime;
		turntimer = turntime;
		commented = false;
	}
	
}
function side_aim() {
	if GAMETURN==0 {
		with obj_monster_battle {
			actor_aim();
		}
	}
	else {
		with obj_enemy_battle {
			actor_aim();
		}
	}
}
function battle_turnstart() {
	
	if APPROVAL>=APPROVAL_MAX {
		PLAYERSTATS.monsterhp = min(PLAYERSTATS.monsterhp+1,MONSTERHP_MAX);
		APPROVAL = APPROVAL_MAX/2;
	}
	
	if PLAYERSTATS.leaderhp<=0 {
		transition_cutscene(sp_scene_win);
		return;
	}
	with obj_enemy_battle {
		if myhealth<=0 {
			music_stop();
			music_play(mus_victory,false);
			transition(rm_over1,,.33);
			return;
		}
	}
	if PLAYERSTATS.monsterhp<=0 {
		transition_cutscene(sp_scene_died);
		return;
	}
	if APPROVAL<=0 {
		transition_cutscene(sp_scene_unapproved);
		return;
	}
	
	THINGSDONE = {};
	
	with obj_program {
		turntimer = turntime;
		reaction = "";
		
		var choice = array_random(global.attack_choices);
		
		textbox_battle("use "+choice.name+"!");
		ATTACK_TYPE = -1;
		ATTACK_TYPENAME = -1;
		ATTACK_TOLD = choice.type;
		ATTACK_TOLDNAME = choice.name;
		if GAMETURN==1 {
			ATTACK_TYPE = ATTACK_TOLD;
			ATTACK_TYPENAME = ATTACK_TOLDNAME;
			ATTACK_PIERCES = struct_get(choice,"pierce",false);
			ATTACK_BOUNCES = struct_get(choice,"bounce",false);
		}
		
		turnseed = random_range(-9999,9999);
		
	}
	
	
	
	with obj_menuoption {
		active = false;
	}
	if GAMETURN==0 {
		var options = 2;
		
		var list = instplace_list;
		ds_list_clear(list);
		with obj_menuoption {
			if drawname!=ATTACK_TOLDNAME {
				ds_list_add(list,id);
			}
			else {
				active = true;
			}
		}
		
		//choose random ones
		ds_list_shuffle(list);
		for(var i=0; i<options; i++) {
			with list[| i] {
				active = true;
			}
		}
		
	}
	
	
	side_aim();
	
}












