
if active {
	
	while(place_meeting(x,y,obj_menuoption)) {
		x += 10;
	}

	hovered = PLAYABLE && position_meeting(mouse_x,mouse_y,id);
	
	image_index = 0;
	if hovered {
		
		image_index = 1;
	
		if mouse_l_pr {
			ATTACK_TYPE = type;
			ATTACK_TYPENAME = drawname;
			var choice = global.attack_choices[attackind];
			ATTACK_PIERCES = struct_get(choice,"pierce",false);
			ATTACK_BOUNCES = struct_get(choice,"bounce",false);
			with obj_monster_battle {
				actor_aim();
			}
		}
	}
	
	if drawname==ATTACK_TYPENAME {
		image_index = 2;
	}

}
else {
	x = 0;
}

visible = active;