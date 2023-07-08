///@desc setup battle




var i=0;
with instance_create_depth(0,i++*30,0,obj_menuoption) {
	onclick = function() {
		with obj_monster_battle {
			attack_aimed();
		}
	}
}



with instance_create_depth(0,i++*30,0,obj_menuoption) {
	onclick = function() {
		with obj_monster_battle {
			attack_circle();
		}
	}
}


