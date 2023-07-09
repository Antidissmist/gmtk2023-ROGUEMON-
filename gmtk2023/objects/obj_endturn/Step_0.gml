

if GAMETURN==0 && PLAYABLE && ATTACK_TYPE!=-1 {
	var hover = position_meeting(mouse_x,mouse_y,id);
	image_index = hover;
	if hover {
		global.button_hovered = true;
		if mouse_l_pr {
			battle_endturn();
		}
	}
	image_alpha = 1;
}
else {
	image_index = 0;
	image_alpha = 0;
}