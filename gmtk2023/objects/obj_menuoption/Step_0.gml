

var prevh = hovered;
hovered = position_meeting(mouse_x,mouse_y,id);
image_index = hovered;
if hovered {
	
	
	
	if !prevh {
		with obj_monster_battle {
			attacktype = other.type;
			aim();
		}
	}
	
	if mouse_l_pr {
		with obj_monster_battle {
			attack();
		}
	}
}