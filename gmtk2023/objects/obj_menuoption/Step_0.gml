
if active {

	var prevh = hovered;
	hovered = PLAYABLE && position_meeting(mouse_x,mouse_y,id);
	image_index = hovered;
	if hovered {
	
		if mouse_l_pr {
			ATTACK_TYPE = other.type;
			with obj_monster_battle {
				actor_aim();
			}
		}
	}

}

visible = active;