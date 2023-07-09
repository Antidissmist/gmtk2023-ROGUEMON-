


function battle_enemy_dies() {
	
}
function battle_leader_dies() {
	
}
function battle_monster_dies() {
	
}
function battle_endturn() {
	
	
	//player attack
	if GAMETURN==0 {
		with obj_monster_battle {
			actor_attack();
		}
	}
	else {
		with obj_enemy_battle {
			actor_attack();
		}
	}
	
	GAMETURN = !GAMETURN;
	with obj_program {
		waiting = true;
		waitcheck = waitchecktime;
		turntimer = turntime;
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
	
	if PLAYERSTATS.leaderhp<=0 {
		transition_cutscene(sp_scene_win);
		return;
	}
	with obj_enemy_battle {
		if myhealth<=0 {
			transition(rm_over1);
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
	
	
	
	with obj_program {
		turntimer = turntime;
		
		
		var choices = [
			{name: "Piercing Beam", type: "beam", pierce: true},
			{name: "Energy Beam", type:"beam", bounce: true},
			{name: "Focus Hit", type:"aimed", bounce: true},
			{name: "Energy Sphere", type:"mouse", bounce: true},
			{name: "Storm Blast", type:"circle"},
			//{name: "Mirror Beam", type:"beamback", bounce: true},
			{name: "Laser Wave", type:"laserwave", pierce: true},
		];
		var choice = array_random(choices);
		
		speaktext = "use "+choice.name+"!";
		ATTACK_PIERCES = struct_get(choice,"pierce",false);
		ATTACK_BOUNCES = struct_get(choice,"bounce",false);
		ATTACK_TYPE = choice.type;
		tboxshake = 12;
		
	}
	
	
	
	with obj_menuoption {
		active = false;
	}
	if GAMETURN==0 {
		var options = 3;
		
		var list = instplace_list;
		ds_list_clear(list);
		with obj_menuoption {
			ds_list_add(list,id);
		}
		ds_list_shuffle(list);
		
		for(var i=0; i<options; i++) {
			with list[| i] {
				active = true;
			}
		}
		
	}
	
	
	side_aim();
	
}












